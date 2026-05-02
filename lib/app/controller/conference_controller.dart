import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../base/pref_data.dart';
import '../../../../features/conferences/domain/entities/conference.dart';

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
    );
  }

  Conference toEntity() {
    return Conference(
      id: id,
      name: name,
      logoUrl: logoUrl,
      location: location,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 3)),
      description: description,
      isDemo: isDemo,
    );
  }
}

class ConferenceController extends GetxController {
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
      final String response = await rootBundle.loadString(
        'assets/data/conferences.json',
      );
      final List<dynamic> data = json.decode(response);

      allConferences.value = data
          .map((json) => ConferenceModel.fromJson(json))
          .toList();
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
        .where((conf) => conf.state == filter)
        .toList();
  }

  static Future<ConferenceModel> loadDemoConference() async {
    final String response = await rootBundle.loadString(
      'assets/data/demo_conference.json',
    );
    final Map<String, dynamic> data = json.decode(response);
    return ConferenceModel.fromJson(data);
  }
}
