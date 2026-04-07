import '../../../app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../data/data_file.dart';
import '../../modal/modal_event_category.dart';
import '../../modal/modal_trending_event.dart';
import '../../routes/app_routes.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TrendingController controller = Get.put(TrendingController());
  List<ModalEventCategory> eventCategoryLists = DataFile.eventCategoryList;

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
              "All Trending Events",
              24.sp,
              Colors.black,
              1,
              fontWeight: FontWeight.w700,
            )),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getDivider(
                dividerColor,
                1.h,
              ),
              getVerSpace(16.h),
              buildSearchWidget(context),
              getVerSpace(24.h),
              buildTrendingCategoryList(),
              getVerSpace(24.h),
              buildTrendingEventList(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildTrendingEventList() {
    return Expanded(
      flex: 1,
      child: GetBuilder<TrendingController>(
        init: TrendingController(),
        builder: (controller) => ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          primary: false,
          shrinkWrap: true,
          itemCount: controller.newTrendingEventLists.length,
          itemBuilder: (context, index) {
            ModalTrendingEvent modalTrendingEvent =
                controller.newTrendingEventLists[index];
            return GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.featuredEventDetailRoute);
              },
              child: SizedBox(
                height: 285.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.h),
                          image: DecorationImage(
                              image: AssetImage(Constant.assetImagePath +
                                  modalTrendingEvent.image.toString()),
                              fit: BoxFit.fill)),
                      height: 170.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 12.h, top: 12.h),
                      child: Wrap(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: "#B2000000".toColor(),
                                borderRadius: BorderRadius.circular(12.h)),
                            padding: EdgeInsets.symmetric(
                                vertical: 4.h, horizontal: 10.h),
                            child: getCustomFont(modalTrendingEvent.date ?? "",
                                13.sp, Colors.white, 1,
                                fontWeight: FontWeight.w600, txtHeight: 1.69.h),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      width: 362.w,
                      top: 132.h,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor,
                                  blurRadius: 27,
                                  offset: const Offset(0, 8))
                            ],
                            borderRadius: BorderRadius.circular(22.h)),
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getVerSpace(16.h),
                            getCustomFont(modalTrendingEvent.name ?? "", 18.sp,
                                Colors.black, 1,
                                fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                            getVerSpace(2.h),
                            Row(
                              children: [
                                getSvgImage("location.svg",
                                    width: 20.h,
                                    height: 20.h,
                                    color: greyColor),
                                getHorSpace(5.h),
                                getCustomFont(modalTrendingEvent.location ?? "",
                                    15.sp, greyColor, 1,
                                    fontWeight: FontWeight.w500,
                                    txtHeight: 1.5.h)
                              ],
                            ),
                            getVerSpace(15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    getAssetImage(
                                        modalTrendingEvent.sponser ?? '',
                                        height: 30.h,
                                        width: 30.h),
                                    getHorSpace(8.h),
                                    getCustomFont(
                                        "Sponser", 15.sp, greyColor, 1,
                                        fontWeight: FontWeight.w500,
                                        txtHeight: 1.46.h)
                                  ],
                                ),
                                getButton(context, accentColor, "Join",
                                    Colors.white, () {}, 14.sp,
                                    weight: FontWeight.w700,
                                    buttonHeight: 40.h,
                                    borderRadius: BorderRadius.circular(14.h),
                                    buttonWidth: 102.h)
                              ],
                            ),
                            getVerSpace(16.h),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
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

  SizedBox buildTrendingCategoryList() {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: eventCategoryLists.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          ModalEventCategory modalEventCategory = eventCategoryLists[index];
          return GestureDetector(
            onTap: () {
              controller.onChange(index.obs);
            },
            child: GetX<TrendingController>(
              init: TrendingController(),
              builder: (controller) => Container(
                margin:
                    EdgeInsets.only(right: 12.h, left: index == 0 ? 20.h : 0),
                height: 50.h,
                decoration: BoxDecoration(
                    color: controller.select.value == index
                        ? accentColor
                        : lightColor,
                    borderRadius: BorderRadius.circular(22.h)),
                alignment: Alignment.center,
                child: modalEventCategory.image == ""
                    ? getPaddingWidget(
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 13.h),
                        getCustomFont(
                          modalEventCategory.name ?? "",
                          16.sp,
                          controller.select.value == index
                              ? Colors.white
                              : Colors.black,
                          1,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Row(
                        children: [
                          Row(
                            children: [
                              getPaddingWidget(
                                EdgeInsets.only(
                                    left: 3.h, top: 3.h, bottom: 3.h),
                                Container(
                                  height: 44.h,
                                  width: 44.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.h)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 9.h),
                                  child: getAssetImage(
                                      modalEventCategory.image ?? "",
                                      height: 26.h,
                                      width: 26.h),
                                ),
                              ),
                              getHorSpace(10.h),
                            ],
                          ),
                          getCustomFont(
                            modalEventCategory.name ?? '',
                            16.sp,
                            controller.select.value == index
                                ? Colors.white
                                : Colors.black,
                            1,
                            fontWeight: FontWeight.w600,
                          ),
                          getHorSpace(13.h)
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
