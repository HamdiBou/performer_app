import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../base/color_data.dart';
import '../../../../base/widget_utils.dart';
import '../../../sessions/presentation/screens/sessions_screen.dart';
import '../../../speakers/presentation/screens/speakers_screen.dart';
import '../../../sponsors/presentation/screens/sponsors_screen.dart';

class ConferenceDashboardScreen extends StatelessWidget {
  const ConferenceDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return GetBuilder<_DashboardController>(
      init: _DashboardController(),
      builder: (controller) => Scaffold(
        backgroundColor: bgColor,
        appBar: getToolBar(
          () => Get.back(),
          title: getCustomFont(
            "Conference",
            24.sp,
            Colors.black,
            1,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Column(
          children: [
            getDivider(dividerColor, 1.h),
            Expanded(child: controller.pages[controller.currentIndex]),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.h)),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: const Offset(0, -4),
                blurRadius: 16,
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: "calendar.svg",
                    label: "Schedule",
                    index: 0,
                    controller: controller,
                  ),
                  _buildNavItem(
                    icon: "speaker.svg",
                    label: "Speakers",
                    index: 1,
                    controller: controller,
                  ),
                  _buildNavItem(
                    icon: "sponsor.svg",
                    label: "Sponsors",
                    index: 2,
                    controller: controller,
                  ),
                  _buildNavItem(
                    icon: "map.svg",
                    label: "Map",
                    index: 3,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
    required _DashboardController controller,
  }) {
    final isSelected = controller.currentIndex == index;
    return GestureDetector(
      onTap: () => controller.selectTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? lightAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(22.h),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            getSvgImage(
              icon,
              width: 20.h,
              height: 20.h,
              color: isSelected ? accentColor : greyColor,
            ),
            getHorSpace(6.w),
            getCustomFont(
              label,
              14.sp,
              isSelected ? accentColor : greyColor,
              1,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardController extends GetxController {
  int currentIndex = 0;

  final List<Widget> _pages = const [
    SessionsScreen(),
    SpeakersScreen(),
    SponsorsScreen(),
    Center(child: Text("Map")),
  ];

  List<Widget> get pages => _pages;

  void selectTab(int index) {
    currentIndex = index;
    update();
  }
}
