import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:test_login/base/pref_data.dart';
import 'package:test_login/core/network/api_client.dart';
import 'dart:convert';
import '../../domain/entities/conference.dart';
import '../../domain/repositories/conference_repository.dart';

@LazySingleton(as: ConferenceRepository)
class ConferenceRepositoryImpl implements ConferenceRepository {
  final ApiClient _apiClient;

  ConferenceRepositoryImpl(this._apiClient);

  @override
  Future<Either<Failure, List<Conference>>> getConferences() async {
    List<Conference> cachedConferences = [];
    try {
      // 1. Try to load from cache first
      final cachedData = await PrefData.getConferences();
      if (cachedData != null) {
        cachedConferences = (jsonDecode(cachedData) as List)
            .map((json) => Conference.fromJson(json))
            .toList();
      }

      // 2. Fetch from API
      final response = await _apiClient.get('conferences');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Conference> conferences = data
            .map((json) => Conference.fromJson(json))
            .toList();

        // 3. Update cache
        await PrefData.saveConferences(
          jsonEncode(conferences.map((e) => e.toJson()).toList()),
        );

        return Right(conferences);
      } else {
        if (cachedConferences.isNotEmpty) {
          return Right(cachedConferences);
        }
        return Left(
          ConferenceFailure(
            'Failed to fetch conferences: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      if (cachedConferences.isNotEmpty) {
        return Right(cachedConferences);
      }
      return Left(ConferenceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> selectConference(Conference conference) async {
    try {
      await PrefData.setSelectedConference(conference.id, conference.name);
      return const Right(null);
    } catch (e) {
      return Left(ConferenceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Conference?>> getSelectedConference() async {
    try {
      final id = await PrefData.getSelectedConferenceId();
      if (id == null) return const Right(null);

      if (id == 'demo') {
        try {
          final String response = await rootBundle.loadString(
            'assets/data/demo_conference.json',
          );
          final data = json.decode(response);
          return Right(Conference.fromJson(data));
        } catch (_) {
          return const Right(null);
        }
      }

      final conferencesResult = await getConferences();
      return conferencesResult.fold((failure) => Left(failure), (list) {
        try {
          final conference = list.firstWhere((c) => c.id == id);
          return Right(conference);
        } catch (_) {
          return const Right(null);
        }
      });
    } catch (e) {
      return Left(ConferenceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearSelectedConference() async {
    try {
      await PrefData.clearSelectedConference();
      return const Right(null);
    } catch (e) {
      return Left(ConferenceFailure(e.toString()));
    }
  }
}
