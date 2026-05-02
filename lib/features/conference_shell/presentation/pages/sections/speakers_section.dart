import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpeakersSection extends StatelessWidget {
  const SpeakersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Speaker ${index + 1}"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 50.r),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Expert in Flutter and Dart with over 10 years of experience in software architecture. Specialized in building high-performance mobile applications.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Close"),
                  ),
                ],
              ),
            );
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 40.r),
              ),
              SizedBox(height: 8.h),
              Text(
                "Speaker ${index + 1}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Company ${index + 1}",
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
