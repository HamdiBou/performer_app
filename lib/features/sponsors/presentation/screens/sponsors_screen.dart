import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.h),
      children: [
        _buildSponsorTier("Platinum Sponsors", [
          "Google",
          "Amazon Web Services",
        ]),
        getVerSpace(24.h),
        _buildSponsorTier("Gold Sponsors", [
          "Codemagic",
          "Very Good Ventures",
          "Stream",
        ]),
        getVerSpace(24.h),
        _buildSponsorTier("Silver Sponsors", ["RevenueCat", "Appwrite"]),
      ],
    );
  }

  Widget _buildSponsorTier(String title, List<String> sponsors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont(
          title,
          20.sp,
          Colors.black,
          1,
          fontWeight: FontWeight.w700,
        ),
        getVerSpace(12.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: sponsors.map((sponsor) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: lightAccent,
                borderRadius: BorderRadius.circular(12.h),
                border: Border.all(color: accentColor.withOpacity(0.3)),
              ),
              child: getCustomFont(
                sponsor,
                16.sp,
                accentColor,
                1,
                fontWeight: FontWeight.w700,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
