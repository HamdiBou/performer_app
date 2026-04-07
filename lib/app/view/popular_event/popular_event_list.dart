import '../../../app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../modal/modal_popular_event.dart';

class PopularEventList extends StatefulWidget {
  const PopularEventList({Key? key}) : super(key: key);

  @override
  State<PopularEventList> createState() => _PopularEventListState();
}

class _PopularEventListState extends State<PopularEventList> {
  void backClick() {
    Constant.backToPrev(context);
  }

  PopularEventController controller = Get.put(PopularEventController());

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: getToolBar(() {
          backClick();
        },
            title: getCustomFont(
              "All Popular Events",
              24.sp,
              Colors.black,
              1,
              fontWeight: FontWeight.w700,
            )),
        body: SafeArea(
          child: Column(
            children: [
              getDivider(
                dividerColor,
                1.h,
              ),
              getVerSpace(16.h),
              buildSearchWidget(context),
              getVerSpace(24.h),
              Expanded(
                  child: GetBuilder<PopularEventController>(
                init: PopularEventController(),
                builder: (controller) => ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  itemCount: controller.newPopularEventLists.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ModalPopularEvent modalPopularEvent =
                        controller.newPopularEventLists[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: shadowColor,
                                blurRadius: 27,
                                offset: const Offset(0, 8))
                          ],
                          borderRadius: BorderRadius.circular(22.h)),
                      padding: EdgeInsets.only(
                          top: 7.h, left: 7.h, bottom: 6.h, right: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                getAssetImage(modalPopularEvent.image ?? "",
                                    width: 82.h, height: 82.h),
                                getHorSpace(10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getCustomFont(modalPopularEvent.name ?? "",
                                        18.sp, Colors.black, 1,
                                        fontWeight: FontWeight.w600,
                                        txtHeight: 1.5.h),
                                    getVerSpace(4.h),
                                    getCustomFont(modalPopularEvent.date ?? '',
                                        15.sp, greyColor, 1,
                                        fontWeight: FontWeight.w500,
                                        txtHeight: 1.46.h)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 34.h,
                            decoration: BoxDecoration(
                                color: lightAccent,
                                borderRadius: BorderRadius.circular(12.h)),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: getCustomFont(modalPopularEvent.price ?? '',
                                15.sp, accentColor, 1,
                                fontWeight: FontWeight.w600, txtHeight: 1.46.h),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchWidget(BuildContext context) {
    return getPaddingWidget(
      EdgeInsets.symmetric(horizontal: 20.h),
      getDefaultTextFiledWithLabel(
          context, "Search events...", controller.searchController,
          isEnable: false,
          isprefix: true,
          prefix: Row(
            children: [
              getHorSpace(18.h),
              getSvgImage("search.svg", height: 24.h, width: 24.h),
            ],
          ),
          constraint: BoxConstraints(maxHeight: 24.h, maxWidth: 55.h),
          vertical: 18,
          horizontal: 16,
          onChanged: controller.onItemChanged),
    );
  }
}
