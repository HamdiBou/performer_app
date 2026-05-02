import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'announcement_detail_page.dart';

class AnnouncementsSection extends StatelessWidget {
  const AnnouncementsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 16.h),
          child: ListTile(
            leading: Icon(Icons.campaign, color: Colors.orange),
            title: Text("Announcement ${index + 1}"),
            subtitle: Text("Important update regarding the event schedule..."),
            trailing: Text("2h ago", style: TextStyle(fontSize: 10.sp)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnnouncementDetailPage(
                    title: "Announcement ${index + 1}",
                    content:
                        "This is the detailed content for announcement ${index + 1}. It provides all the necessary information about the event update, including timing, location changes, and important instructions for attendees.",
                    date: "May 02, 2026",
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
