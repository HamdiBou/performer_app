import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';

class CertificateSection extends StatelessWidget {
  const CertificateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.h),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Column(
              children: [
                getCustomFont(
                  "CONFERENCE PASS",
                  14.sp,
                  greyColor,
                  1,
                  fontWeight: FontWeight.w800,
                ),
                getVerSpace(24.h),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                  child: Icon(Icons.qr_code_2_rounded, size: 200.h, color: Colors.black),
                ),
                getVerSpace(24.h),
                getCustomFont(
                  "John Doe",
                  24.sp,
                  Colors.black,
                  1,
                  fontWeight: FontWeight.w800,
                ),
                getCustomFont(
                  "Attendee • ID: #FL-2026-042",
                  14.sp,
                  greyColor,
                  1,
                  fontWeight: FontWeight.w500,
                ),
                getVerSpace(24.h),
                const Divider(),
                getVerSpace(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoItem("GATE", "H-4"),
                    _buildInfoItem("ZONE", "PLATINUM"),
                    _buildInfoItem("SEAT", "A-12"),
                  ],
                ),
              ],
            ),
          ),
          getVerSpace(32.h),
          SizedBox(
            width: double.infinity,
            child: getButton(
              context,
              accentColor,
              "Download Digital Badge",
              Colors.white,
              () {},
              16.sp,
              weight: FontWeight.w700,
              borderRadius: BorderRadius.circular(16.h),
              buttonHeight: 56.h,
            ),
          ),
          getVerSpace(16.h),
          getCustomFont(
            "Show this QR code at the entrance to check-in.",
            13.sp,
            greyColor,
            2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        getCustomFont(label, 12.sp, greyColor, 1, fontWeight: FontWeight.w600),
        getVerSpace(4.h),
        getCustomFont(value, 18.sp, Colors.black, 1, fontWeight: FontWeight.w800),
      ],
    );
  }
}
