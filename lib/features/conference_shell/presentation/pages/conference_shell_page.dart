import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_login/base/color_data.dart';
import 'package:test_login/base/widget_utils.dart';
import 'package:test_login/features/conference_shell/presentation/bloc/shell_bloc.dart';
import 'package:test_login/features/conference_shell/domain/entities/conference_shell_config.dart';
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart';
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
                        _buildShell(context, config, selected.name, selected.logoUrl),
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
    String logoUrl,
  ) {
    final Color primaryColor = Color(
      int.parse(config.primaryColorHex.replaceFirst('#', '0xff')),
    );

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70.h,
        leading: Padding(
          padding: EdgeInsets.all(12.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.h),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.h),
              child: Image.network(
                logoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    getSvgImage("splash_logo.png", width: 30.h, height: 30.h),
              ),
            ),
          ),
        ),
        title: getCustomFont(
          conferenceName,
          18.sp,
          Colors.black,
          1,
          fontWeight: FontWeight.w800,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded, color: Colors.black, size: 24.h),
            onPressed: () {
              context.read<ConferenceBloc>().add(
                const ConferenceEvent.clearSelectedConference(),
              );
              context.go('/public');
            },
          ),
          getHorSpace(8.w),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 1.h,
            color: dividerColor,
          ),
          Expanded(child: _buildDynamicContent(config)),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context, config, primaryColor),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/ai-assistant'),
        backgroundColor: primaryColor,
        icon: const Icon(Icons.smart_toy_rounded, color: Colors.white),
        label: getCustomFont("Ask AI", 14.sp, Colors.white, 1, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildDynamicContent(ConferenceShellConfig config) {
    if (config.enabledSections.isEmpty) {
      return Center(
        child: getCustomFont(
          "No sections enabled for this conference.",
          16.sp,
          greyColor,
          1,
          fontWeight: FontWeight.w500,
        ),
      );
    }

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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex >= config.enabledSections.length
            ? 0
            : _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Gilroy',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Gilroy',
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: config.enabledSections.map((section) {
          return BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Icon(_getSectionIcon(section)),
            ),
            label: _getSectionLabel(section),
          );
        }).toList(),
      ),
    );
  }

  IconData _getSectionIcon(ShellSection section) {
    switch (section) {
      case ShellSection.schedule:
        return Icons.calendar_month_rounded;
      case ShellSection.speakers:
        return Icons.record_voice_over_rounded;
      case ShellSection.attendees:
        return Icons.groups_rounded;
      case ShellSection.sponsors:
        return Icons.handshake_rounded;
      case ShellSection.certificate:
        return Icons.workspace_premium_rounded;
      case ShellSection.announcements:
        return Icons.newspaper_rounded;
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
        return 'Pass';
      case ShellSection.announcements:
        return 'Feed';
    }
  }
}
