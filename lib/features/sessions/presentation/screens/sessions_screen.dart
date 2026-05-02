import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              labelColor: accentColor,
              unselectedLabelColor: greyColor,
              indicatorColor: accentColor,
              labelStyle: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              tabs: [
                Tab(text: "Day 1 (May 1)"),
                Tab(text: "Day 2 (May 2)"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildSessionList([
                  _SessionData(
                    "9:00 AM",
                    "Keynote: Flutter in 2026",
                    "Main Hall",
                    "John Doe",
                  ),
                  _SessionData(
                    "10:30 AM",
                    "State Management with Riverpod",
                    "Room A",
                    "Jane Smith",
                  ),
                  _SessionData(
                    "1:00 PM",
                    "Building Animations",
                    "Room B",
                    "Alex Johnson",
                  ),
                ]),
                _buildSessionList([
                  _SessionData(
                    "9:00 AM",
                    "Dart 4.0 Features",
                    "Main Hall",
                    "Sarah Lee",
                  ),
                  _SessionData(
                    "11:00 AM",
                    "Clean Architecture",
                    "Room A",
                    "Chris White",
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionList(List<_SessionData> sessions) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
          child: ListTile(
            contentPadding: EdgeInsets.all(16.h),
            leading: Container(
              height: 48.h,
              width: 48.h,
              decoration: BoxDecoration(
                color: lightAccent,
                borderRadius: BorderRadius.circular(12.h),
              ),
              child: Icon(Icons.access_time, color: accentColor, size: 24.h),
            ),
            title: getCustomFont(
              session.title,
              16.sp,
              Colors.black,
              1,
              fontWeight: FontWeight.w700,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(4.h),
                getCustomFont(
                  session.speaker,
                  14.sp,
                  greyColor,
                  1,
                  fontWeight: FontWeight.w500,
                ),
                getVerSpace(2.h),
                getCustomFont(
                  session.room,
                  13.sp,
                  greyColor,
                  1,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            trailing: getSvgImage(
              "bookmark.svg",
              width: 24.h,
              height: 24.h,
              color: greyColor,
            ),
          ),
        );
      },
    );
  }
}

class _SessionData {
  final String time;
  final String title;
  final String room;
  final String speaker;

  _SessionData(this.time, this.title, this.room, this.speaker);
}
