import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendeesSection extends StatelessWidget {
  const AttendeesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.h),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 20.r),
          ),
          title: Text("Attendee ${index + 1}"),
          subtitle: Text("Software Engineer"),
          trailing: IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Opening chat with Attendee ${index + 1}..."),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
