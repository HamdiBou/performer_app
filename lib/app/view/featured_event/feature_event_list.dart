import '../../../app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../modal/modal_feature_event.dart';
import '../../routes/app_routes.dart';

class FeatureEventList extends StatefulWidget {
  const FeatureEventList({Key? key}) : super(key: key);

  @override
  State<FeatureEventList> createState() => _FeatureEventListState();
}

class _FeatureEventListState extends State<FeatureEventList> {
  void backClick() {
    Constant.backToPrev(context);
  }

  FeatureEventController controller = Get.put(FeatureEventController());

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
              "All Featured Events",
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
                  child: GetBuilder<FeatureEventController>(
                init: FeatureEventController(),
                builder: (controller) => ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.newfeatureEventLists.length,
                  itemBuilder: (context, index) {
                    ModalFeatureEvent modalFeatureEvent =
                        controller.newfeatureEventLists[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      height: 196.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.h),
                        image: DecorationImage(
                            image: AssetImage(Constant.assetImagePath +
                                modalFeatureEvent.image.toString()),
                            fit: BoxFit.fill),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Constant.sendToNext(
                              context, Routes.featuredEventDetailRoute);
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 196.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.h),
                                  gradient: LinearGradient(
                                      colors: [
                                        "#000000".toColor().withOpacity(0.0),
                                        "#000000".toColor().withOpacity(0.88)
                                      ],
                                      stops: const [
                                        0.0,
                                        1.0
                                      ],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft)),
                              padding: EdgeInsets.only(left: 24.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  getCustomFont(modalFeatureEvent.name ?? "",
                                      20.sp, Colors.white, 1,
                                      fontWeight: FontWeight.w700,
                                      txtHeight: 1.5.h),
                                  getVerSpace(4.h),
                                  Row(
                                    children: [
                                      getSvgImage("location.svg",
                                          width: 20.h, height: 20.h),
                                      getHorSpace(5.h),
                                      getCustomFont(
                                          modalFeatureEvent.location ?? "",
                                          15.sp,
                                          Colors.white,
                                          1,
                                          fontWeight: FontWeight.w500,
                                          txtHeight: 1.5.h),
                                    ],
                                  ),
                                  getVerSpace(22.h),
                                  getButton(context, accentColor, "Book Now",
                                      Colors.white, () {}, 14.sp,
                                      weight: FontWeight.w700,
                                      buttonHeight: 40.h,
                                      borderRadius: BorderRadius.circular(14.h),
                                      buttonWidth: 111.h)
                                ],
                              ),
                            )
                          ],
                        ),
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
