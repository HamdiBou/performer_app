import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';
import '../../../../conferences/presentation/bloc/conference_bloc.dart';
import '../../../../sessions/domain/entities/session.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConferenceBloc, ConferenceState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (conferences, selected) {
            if (selected == null || selected.sessions == null || selected.sessions!.isEmpty) {
              return Center(
                child: getCustomFont(
                  "No sessions scheduled yet.",
                  16.sp,
                  greyColor,
                  1,
                  fontWeight: FontWeight.w500,
                ),
              );
            }

            final sessions = selected.sessions!;
            // Group sessions by date
            final groupedSessions = <String, List<Session>>{};
            for (var session in sessions) {
              final dateKey = DateFormat('MMM d, yyyy').format(session.startTime.toLocal());
              if (!groupedSessions.containsKey(dateKey)) {
                groupedSessions[dateKey] = [];
              }
              groupedSessions[dateKey]!.add(session);
            }

            final dates = groupedSessions.keys.toList()..sort();

            return DefaultTabController(
              length: dates.length,
              child: Column(
                children: [
                  if (dates.length > 1)
                    Container(
                      color: Colors.white,
                      child: TabBar(
                        isScrollable: true,
                        labelColor: accentColor,
                        unselectedLabelColor: greyColor,
                        indicatorColor: accentColor,
                        tabs: dates.map((date) => Tab(text: date)).toList(),
                      ),
                    ),
                  Expanded(
                    child: TabBarView(
                      children: dates.map((date) {
                        final daySessions = groupedSessions[date]!
                          ..sort((a, b) => a.startTime.compareTo(b.startTime));
                        return _buildSessionList(context, daySessions, selected.speakers ?? []);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildSessionList(BuildContext context, List<Session> sessions, List<dynamic> speakers) {
    return ListView.builder(
      padding: EdgeInsets.all(20.h),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        final speaker = speakers.firstWhere(
          (s) => s.id == session.speakerId,
          orElse: () => null,
        );
        final startTime = DateFormat('h:mm a').format(session.startTime.toLocal());
        final endTime = DateFormat('h:mm a').format(session.endTime.toLocal());

        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.h),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: const Offset(0, 4),
                blurRadius: 12,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCustomFont(
                    startTime,
                    14.sp,
                    accentColor,
                    1,
                    fontWeight: FontWeight.w700,
                  ),
                  getCustomFont(
                    "to",
                    10.sp,
                    greyColor,
                    1,
                  ),
                  getCustomFont(
                    endTime,
                    12.sp,
                    greyColor,
                    1,
                  ),
                ],
              ),
              title: getCustomFont(
                session.title,
                16.sp,
                Colors.black,
                2,
                fontWeight: FontWeight.w700,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(4.h),
                  Row(
                    children: [
                      Icon(Icons.person, size: 14.h, color: greyColor),
                      getHorSpace(4.w),
                      Expanded(
                        child: getCustomFont(
                          speaker?.name ?? "TBA",
                          13.sp,
                          greyColor,
                          1,
                        ),
                      ),
                    ],
                  ),
                  getVerSpace(2.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14.h, color: greyColor),
                      getHorSpace(4.w),
                      Expanded(
                        child: getCustomFont(
                          session.room,
                          13.sp,
                          greyColor,
                          1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      getVerSpace(8.h),
                      getCustomFont(
                        "About this session",
                        14.sp,
                        Colors.black,
                        1,
                        fontWeight: FontWeight.w600,
                      ),
                      getVerSpace(4.h),
                      getCustomFont(
                        session.description,
                        14.sp,
                        Colors.black87,
                        10,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
