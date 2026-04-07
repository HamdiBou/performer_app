import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/conference_controller.dart';
import '../widgets/state_filter_tabs.dart';
import '../widgets/conference_card.dart';
import '../../../base/color_data.dart';
import '../../../base/widget_utils.dart';
import 'conference_description_screen.dart';

class PublicConferencesScreen extends StatelessWidget {
  PublicConferencesScreen({Key? key}) : super(key: key);

  final ConferenceController controller = Get.put(ConferenceController());

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getToolBar(
        () {
          // exit logic or nothing
        },
        title: getCustomFont(
          "Conferences",
          24.sp,
          Colors.black,
          1,
          fontWeight: FontWeight.w700,
        ),
        leading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            getDivider(dividerColor, 1.h),
            Obx(
              () => StateFilterTabs(
                filters: const ['Ongoing', 'Upcoming', 'Past'],
                selectedFilter: controller.currentFilter.value,
                onFilterSelected: (String filter) {
                  controller.applyFilter(filter);
                },
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.filteredConferences.isEmpty) {
                  return Center(
                    child: getCustomFont(
                      "No events found.",
                      16.sp,
                      Colors.grey,
                      1,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.filteredConferences.length,
                  itemBuilder: (context, index) {
                    final conf = controller.filteredConferences[index];
                    return ConferenceCard(
                      logoUrl: conf.logoUrl,
                      name: conf.name,
                      description: conf.description,
                      state: conf.state,
                      onTap: () {
                        Get.to(
                          () => ConferenceDescriptionScreen(conference: conf),
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
