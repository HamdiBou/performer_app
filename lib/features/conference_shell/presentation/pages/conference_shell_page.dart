import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_login/base/color_data.dart';
import 'package:test_login/base/widget_utils.dart';
import 'package:test_login/features/conference_shell/presentation/bloc/shell_bloc.dart';
import 'package:test_login/features/conference_shell/domain/entities/conference_shell_config.dart';
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart';
import 'package:test_login/features/auth/presentation/bloc/auth_bloc.dart';
import 'sections/schedule_section.dart';
import 'sections/speakers_section.dart';
import 'sections/attendees_section.dart';
import 'sections/sponsors_section.dart';
import 'sections/certificate_section.dart';
import 'sections/announcements_section.dart';

/// Dynamic shell page that adapts based on remote config.
class ConferenceShellPage extends StatefulWidget {
  const ConferenceShellPage({Key? key}) : super(key: key);

  @override
  State<ConferenceShellPage> createState() => _ConferenceShellPageState();
}

class _ConferenceShellPageState extends State<ConferenceShellPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConferenceBloc, ConferenceState>(
      builder: (context, conferenceState) {
        return conferenceState.maybeWhen(
          loaded: (conferences, selected) {
            if (selected == null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/public');
              });
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            return BlocProvider.value(
              value: context.read<ShellBloc>()
                ..add(ShellEvent.loadConfig(selected.id)),
              child: BlocBuilder<ShellBloc, ShellState>(
                builder: (context, shellState) {
                  return shellState.maybeWhen(
                    loading: () => const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    ),
                    error: (message) =>
                        Scaffold(body: Center(child: Text(message))),
                    loaded: (config) =>
                        _buildShell(context, config, selected.name),
                    orElse: () => const Scaffold(
                      body: Center(child: Text('Initializing shell...')),
                    ),
                  );
                },
              ),
            );
          },
          orElse: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }

  Widget _buildShell(
    BuildContext context,
    ConferenceShellConfig config,
    String conferenceName,
  ) {
    final Color primaryColor = Color(
      int.parse(config.primaryColorHex.replaceFirst('#', '0xff')),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.h),
          child: getSvgImage("splash_logo.png", width: 40.h, height: 40.h),
        ),
        title: Text(
          conferenceName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              context.read<ConferenceBloc>().add(
                const ConferenceEvent.clearSelectedConference(),
              );
              context.go('/public');
            },
          ),
        ],
      ),
      body: _buildDynamicContent(config),
      bottomNavigationBar: _buildBottomNav(context, config, primaryColor),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/ai-assistant'),
        backgroundColor: primaryColor,
        child: const Icon(Icons.smart_toy, color: Colors.white),
      ),
    );
  }

  Widget _buildDynamicContent(ConferenceShellConfig config) {
    if (config.enabledSections.isEmpty) {
      return const Center(
        child: Text("No sections enabled for this conference."),
      );
    }

    // Ensure index is within bounds if config changes
    if (_selectedIndex >= config.enabledSections.length) {
      _selectedIndex = 0;
    }

    final section = config.enabledSections[_selectedIndex];

    switch (section) {
      case ShellSection.schedule:
        return const ScheduleSection();
      case ShellSection.speakers:
        return const SpeakersSection();
      case ShellSection.attendees:
        return const AttendeesSection();
      case ShellSection.sponsors:
        return const SponsorsSection();
      case ShellSection.certificate:
        return const CertificateSection();
      case ShellSection.announcements:
        return const AnnouncementsSection();
    }
  }

  Widget _buildBottomNav(
    BuildContext context,
    ConferenceShellConfig config,
    Color primaryColor,
  ) {
    if (config.enabledSections.isEmpty) return const SizedBox.shrink();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex >= config.enabledSections.length
          ? 0
          : _selectedIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: config.enabledSections.map((section) {
        return BottomNavigationBarItem(
          icon: Icon(_getSectionIcon(section)),
          label: _getSectionLabel(section),
        );
      }).toList(),
    );
  }

  IconData _getSectionIcon(ShellSection section) {
    switch (section) {
      case ShellSection.schedule:
        return Icons.calendar_today;
      case ShellSection.speakers:
        return Icons.people;
      case ShellSection.attendees:
        return Icons.group;
      case ShellSection.sponsors:
        return Icons.business;
      case ShellSection.certificate:
        return Icons.card_membership;
      case ShellSection.announcements:
        return Icons.campaign;
    }
  }

  String _getSectionLabel(ShellSection section) {
    switch (section) {
      case ShellSection.schedule:
        return 'Schedule';
      case ShellSection.speakers:
        return 'Speakers';
      case ShellSection.attendees:
        return 'Attendees';
      case ShellSection.sponsors:
        return 'Sponsors';
      case ShellSection.certificate:
        return 'Certificate';
      case ShellSection.announcements:
        return 'Feed';
    }
  }
}
