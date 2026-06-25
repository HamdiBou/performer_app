import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import '../../../base/pref_data.dart';
import '../../../../features/conferences/domain/entities/conference.dart';
import '../../../../features/conferences/domain/repositories/conference_repository.dart';
import '../../../../features/sessions/domain/entities/session.dart';
import '../../../../features/speakers/domain/entities/speaker.dart';
import '../../../../features/sponsors/domain/entities/sponsor.dart';
import 'package:test_login/core/di/injection.dart';
import 'dart:convert';

class ConferenceModel {
  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final String websiteUrl;
  final String performerUrl;
  final String state;
  final String date;
  final String time;
  final String location;
  final bool isDemo;
  final List<Session>? sessions;
  final List<Speaker>? speakers;
  final List<Sponsor>? sponsors;

  ConferenceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.websiteUrl,
    required this.performerUrl,
    required this.state,
    required this.date,
    required this.time,
    required this.location,
    this.isDemo = false,
    this.sessions,
    this.speakers,
    this.sponsors,
  });

  factory ConferenceModel.fromJson(Map<String, dynamic> json) {
    return ConferenceModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      logoUrl: json['logo_url'] ?? '',
      websiteUrl: json['website_url'] ?? '',
      performerUrl: json['performer_url'] ?? '',
      state: json['state'] ?? 'Ongoing',
      date: json['date'] ?? 'TBD',
      time: json['time'] ?? 'TBD',
      location: json['location'] ?? 'TBD',
      isDemo: json['is_demo'] ?? false,
      sessions: json['sessions'] != null
          ? (json['sessions'] as List).map((i) => Session.fromJson(i)).toList()
          : null,
      speakers: json['speakers'] != null
          ? (json['speakers'] as List).map((i) => Speaker.fromJson(i)).toList()
          : null,
      sponsors: json['sponsors'] != null
          ? (json['sponsors'] as List).map((i) => Sponsor.fromJson(i)).toList()
          : null,
    );
  }

  Conference toEntity() {
    return Conference(
      id: id,
      name: name,
      logoUrl: logoUrl,
      location: location,
      description: description,
      websiteUrl: websiteUrl,
      performerUrl: performerUrl,
      state: state,
      date: date,
      time: time,
      isDemo: isDemo,
      sessions: sessions,
      speakers: speakers,
      sponsors: sponsors,
    );
  }
}

class ConferenceController extends GetxController {
  final ConferenceRepository _repository = getIt<ConferenceRepository>();
  final RxBool isLoading = true.obs;
  final RxString currentFilter = 'Ongoing'.obs;
  final Rx<String?> selectedConferenceId = Rx<String?>(null);
  final RxString errorMessage = ''.obs;

  final RxList<ConferenceModel> allConferences = <ConferenceModel>[].obs;
  final RxList<ConferenceModel> filteredConferences = <ConferenceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSelectedConference();
    fetchConferences();
  }

  Future<void> loadSelectedConference() async {
    selectedConferenceId.value = await PrefData.getSelectedConferenceId();
  }

  Future<void> fetchConferences() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final result = await _repository.getConferences();
      result.fold(
        (failure) {
          errorMessage.value = failure.message;
          allConferences.value = [];
        },
        (conferences) {
          allConferences.value = conferences
              .map(
                (c) => ConferenceModel(
                  id: c.id,
                  name: c.name,
                  description: c.description ?? '',
                  logoUrl: c.logoUrl,
                  websiteUrl: c.websiteUrl ?? '',
                  performerUrl: c.performerUrl ?? '',
                  state: c.state,
                  date: c.date ?? 'TBD',
                  time: c.time ?? 'TBD',
                  location: c.location,
                  isDemo: c.isDemo,
                  sessions: c.sessions,
                  speakers: c.speakers,
                  sponsors: c.sponsors,
                ),
              )
              .toList();
        },
      );
    } catch (e) {
      errorMessage.value = 'Failed to load conferences: $e';
      allConferences.value = [];
    } finally {
      applyFilter(currentFilter.value);
      isLoading.value = false;
    }
  }

  void applyFilter(String filter) {
    currentFilter.value = filter;
    filteredConferences.value = allConferences
        .where(
          (conf) =>
              conf.state.toLowerCase().trim() == filter.toLowerCase().trim(),
        )
        .toList();
  }

  static Future<ConferenceModel> loadDemoConference() async {
    final String response = await rootBundle.loadString(
      'assets/data/demo_conference.json',
    );
    final data = json.decode(response);
    return ConferenceModel.fromJson(data);
  }
}
