import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';

class AnnouncementsSection extends StatelessWidget {
  const AnnouncementsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final announcements = [
      {
        "title": "Welcome to Global Flutter Summit 2026!",
        "time": "2 hours ago",
        "content": "We're thrilled to have you here. Check out the schedule to plan your day!",
        "type": "Update",
        "icon": Icons.celebration_rounded,
        "color": Colors.orange,
      },
      {
        "title": "Lunch is being served in Hall B",
        "time": "15 minutes ago",
        "content": "Head over to Hall B for a variety of lunch options. Don't forget your badge!",
        "type": "Info",
        "icon": Icons.restaurant_rounded,
        "color": Colors.blue,
      },
      {
        "title": "New Workshop added: Advanced JNI",
        "time": "1 hour ago",
        "content": "A new workshop on Advanced JNI has been added to Day 2. Register now in the app!",
        "type": "Alert",
        "icon": Icons.event_available_rounded,
        "color": Colors.green,
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(20.h),
      itemCount: announcements.length,
      itemBuilder: (context, index) {
        final item = announcements[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.h),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: const Offset(0, 4),
                blurRadius: 12,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.h)),
                ),
                child: Row(
                  children: [
                    Icon(item['icon'] as IconData, color: item['color'] as Color, size: 20.h),
                    getHorSpace(8.w),
                    getCustomFont(
                      item['type'] as String,
                      12.sp,
                      item['color'] as Color,
                      1,
                      fontWeight: FontWeight.w700,
                    ),
                    const Spacer(),
                    getCustomFont(
                      item['time'] as String,
                      12.sp,
                      greyColor,
                      1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont(
                      item['title'] as String,
                      18.sp,
                      Colors.black,
                      2,
                      fontWeight: FontWeight.w700,
                    ),
                    getVerSpace(8.h),
                    getCustomFont(
                      item['content'] as String,
                      14.sp,
                      Colors.black87,
                      4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
