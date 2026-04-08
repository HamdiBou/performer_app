import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../base/color_data.dart';
import '../../../base/widget_utils.dart';

class ConferenceCard extends StatelessWidget {
  final String logoUrl;
  final String name;
  final String description;
  final String state;
  final VoidCallback onTap;
  final bool isSelected;

  const ConferenceCard({
    Key? key,
    required this.logoUrl,
    required this.name,
    required this.description,
    required this.state,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.h),
          border: isSelected
              ? Border.all(color: accentColor, width: 2.h)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.h),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.h),
                child: Image.network(
                  logoUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.business),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont(
                    name,
                    16.sp,
                    Colors.black,
                    1,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 6.h),
                  getCustomFont(
                    description,
                    14.sp,
                    Colors.grey,
                    2,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            if (isSelected)
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Icon(Icons.check_circle, color: accentColor, size: 24.h),
              ),
          ],
        ),
      ),
    );
  }
}
