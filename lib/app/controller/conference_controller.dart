import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../base/pref_data.dart';

class ConferenceModel {
  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final String websiteUrl;
  final String performerUrl;
  final String state; // Ongoing, Upcoming, Past
  final String date;
  final String time;
  final String location;

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
  });
}

class ConferenceController extends GetxController {
  var isLoading = true.obs;
  var currentFilter = 'Ongoing'.obs;
  var selectedConferenceId = Rx<String?>(null);

  var allConferences = <ConferenceModel>[].obs;
  var filteredConferences = <ConferenceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSelectedConference();
    fetchConferences();
  }

  Future<void> loadSelectedConference() async {
    selectedConferenceId.value = await PrefData.getSelectedConferenceId();
  }

  void fetchConferences() async {
    isLoading.value = true;

    try {
      final String response = await rootBundle.loadString(
        'assets/data/conferences.json',
      );
      final List<dynamic> data = json.decode(response);

      allConferences.value = data.map((json) {
        return ConferenceModel(
          id: json['id'] ?? '',
          name: json['name'] ?? '',
          description: json['description'] ?? '',
          logoUrl: json['logo_url'] ?? '',
          websiteUrl: json['website_url'] ?? '',
          performerUrl: json['performer_url'] ?? '',
          state: json['state'] ?? 'Ongoing', // Fallback as it's missing in json
          date: json['date'] ?? 'TBD',
          time: json['time'] ?? 'TBD',
          location: json['location'] ?? 'TBD',
        );
      }).toList();
    } catch (e) {
      allConferences.value = [];
    }

    applyFilter(currentFilter.value);
    isLoading.value = false;
  }

  void applyFilter(String filter) {
    currentFilter.value = filter;
    filteredConferences.value = allConferences
        .where((conf) => conf.state == filter)
        .toList();
  }
}
