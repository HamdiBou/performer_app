import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_login/base/widget_utils.dart';

class AnnouncementDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String date;

  const AnnouncementDetailPage({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getToolBar(
        () => Navigator.pop(context),
        title: getCustomFont(
          "Announcement Details",
          24.sp,
          Colors.black,
          1,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(
                title,
                22.sp,
                Colors.black,
                1,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16.sp, color: Colors.grey),
                  SizedBox(width: 8.w),
                  getCustomFont(date, 14.sp, Colors.grey, 1),
                ],
              ),
              SizedBox(height: 24.h),
              getDivider(Colors.grey[300]!, 1.h),
              SizedBox(height: 24.h),
              getMultilineCustomFont(
                content,
                16.sp,
                Colors.black54,
                fontWeight: FontWeight.w500,
                txtHeight: 1.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
