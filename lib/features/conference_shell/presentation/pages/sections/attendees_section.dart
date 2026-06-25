import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';

class AttendeesSection extends StatelessWidget {
  const AttendeesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final attendees = [
      {"name": "Alice Freeman", "role": "Flutter Developer", "company": "TechCorp"},
      {"name": "Bob Smith", "role": "UI/UX Designer", "company": "CreativeMind"},
      {"name": "Charlie Brown", "role": "Product Manager", "company": "InnoSoft"},
      {"name": "Diana Prince", "role": "Senior Engineer", "company": "GlobalTech"},
      {"name": "Ethan Hunt", "role": "Security Expert", "company": "SecureOps"},
    ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.h),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search attendees...",
              prefixIcon: Icon(Icons.search_rounded, color: greyColor),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.h),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: attendees.length,
            itemBuilder: (context, index) {
              final person = attendees[index];
              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.h),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.5),
                      offset: const Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12.h),
                  leading: CircleAvatar(
                    radius: 28.r,
                    backgroundColor: lightAccent,
                    child: getCustomFont(
                      person['name']![0],
                      20.sp,
                      accentColor,
                      1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  title: getCustomFont(
                    person['name']!,
                    16.sp,
                    Colors.black,
                    1,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: getCustomFont(
                    "${person['role']} at ${person['company']}",
                    13.sp,
                    greyColor,
                    1,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.chat_bubble_outline_rounded, color: accentColor),
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
