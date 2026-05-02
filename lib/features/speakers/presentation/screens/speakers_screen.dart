import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';

class SpeakersScreen extends StatelessWidget {
  const SpeakersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final speakers = [
      _SpeakerData(
        "John Doe",
        "Senior Engineer, Google",
        "https://via.placeholder.com/150",
      ),
      _SpeakerData(
        "Jane Smith",
        "Flutter GDE",
        "https://via.placeholder.com/150",
      ),
      _SpeakerData(
        "Alex Johnson",
        "Indie Developer",
        "https://via.placeholder.com/150",
      ),
      _SpeakerData(
        "Sarah Lee",
        "Dart Advocate",
        "https://via.placeholder.com/150",
      ),
      _SpeakerData(
        "Chris White",
        "Software Architect",
        "https://via.placeholder.com/150",
      ),
    ];

    return GridView.builder(
      padding: EdgeInsets.all(16.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: speakers.length,
      itemBuilder: (context, index) {
        final speaker = speakers[index];
        return Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80.h,
                width: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightAccent,
                  border: Border.all(color: accentColor, width: 2.h),
                ),
                child: ClipOval(
                  child: Image.network(
                    speaker.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.person, size: 40.h, color: accentColor),
                  ),
                ),
              ),
              getVerSpace(12.h),
              getCustomFont(
                speaker.name,
                16.sp,
                Colors.black,
                1,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              getVerSpace(4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: getCustomFont(
                  speaker.role,
                  12.sp,
                  greyColor,
                  2,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SpeakerData {
  final String name;
  final String role;
  final String imageUrl;

  _SpeakerData(this.name, this.role, this.imageUrl);
}
