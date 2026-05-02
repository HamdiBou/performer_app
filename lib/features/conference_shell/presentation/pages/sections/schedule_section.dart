import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_login/base/widget_utils.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 16.h),
          child: ExpansionTile(
            leading: Text(
              "${10 + index}:00",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Text("Session ${index + 1}: Deep Dive into Flutter"),
            subtitle: Text("Speaker: Jane Doe • Room A"),
            children: [
              Padding(
                padding: EdgeInsets.all(16.h),
                child: Text(
                  "This session covers the latest updates in Flutter, including new widgets, performance optimizations, and best practices for building scalable applications.",
                  style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
