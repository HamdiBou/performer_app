import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:test_login/base/pref_data.dart';
import '../../domain/entities/conference.dart';
import '../../domain/repositories/conference_repository.dart';

@LazySingleton(as: ConferenceRepository)
class ConferenceRepositoryImpl implements ConferenceRepository {
  @override
  Future<Either<Failure, List<Conference>>> getConferences() async {
    try {
      // Mocking the API call for now
      final List<Conference> mockConferences = [
        Conference(
          id: '1',
          name: 'Flutter Conf 2026',
          logoUrl: 'assets/images/logo1.png',
          location: 'San Francisco, CA',
          startDate: DateTime(2026, 4, 1),
          endDate: DateTime(2026, 4, 3),
          description: 'The biggest Flutter conference of the year!',
        ),
        Conference(
          id: '2',
          name: 'Dart Summit 2026',
          logoUrl: 'assets/images/logo2.png',
          location: 'New York, NY',
          startDate: DateTime(2026, 5, 10),
          endDate: DateTime(2026, 5, 12),
          description: 'Deep dive into the Dart language.',
        ),
      ];
      
      // Add the demo conference to the list
      final demoConference = await _loadDemoConference();
      if (demoConference != null) {
        mockConferences.add(demoConference);
      }
      
      return Right(mockConferences);
    } catch (e) {
      return Left(ConferenceFailure(e.toString()));
    }
  }

  Future<Conference?> _loadDemoConference() async {
    try {
      final String response = await rootBundle.loadString('assets/data/demo_conference.json');
      final data = json.decode(response);
      return Conference(
        id: data['id'],
        name: data['name'],
        logoUrl: data['logo_url'],
        location: data['location'],
        startDate: DateTime.now(), // Simplified for demo
        endDate: DateTime.now().add(const Duration(days: 3)),
        description: data['description'],
        isDemo: true,
      );
    } catch (e) {
      return null;
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
      
      final conferences = await getConferences();
      return conferences.fold(
        (failure) => Left(failure),
        (list) {
          try {
            final conference = list.firstWhere((c) => c.id == id);
            return Right(conference);
          } catch (_) {
            return const Right(null);
          }
        },
      );
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
