import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SponsorsSection extends StatelessWidget {
  const SponsorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Sponsor ${index + 1}"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      color: Colors.grey[200],
                      child: Center(child: Icon(Icons.business, size: 50.r)),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Platinum Sponsor. Providing cutting-edge technology and supporting the developer community globally.",
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.h),
              border: Border.all(color: Colors.grey[400]!),
            ),
            child: Center(child: Text("Sponsor ${index + 1}")),
          ),
        );
      },
    );
  }
}
