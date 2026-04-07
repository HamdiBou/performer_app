import '../../../app/data/data_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../modal/modal_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  List<ModalNotification> notificationLists = DataFile.notificationList;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: getToolBar(
          () {
            backClick();
          },
          title: getCustomFont("Notifications", 24.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, textAlign: TextAlign.center),
        ),
        body: SafeArea(
          child: Column(
            children: [
              getDivider(
                dividerColor,
                1.h,
              ),
              notificationLists.isEmpty
                  ? Expanded(
                      flex: 1,
                      child: getPaddingWidget(
                        EdgeInsets.symmetric(horizontal: 20.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 208.h,
                              width: 208.h,
                              decoration: BoxDecoration(
                                  color: lightColor,
                                  borderRadius: BorderRadius.circular(187.h)),
                              padding: EdgeInsets.all(47.h),
                              child: getAssetImage("bell.png",
                                  height: 114.h, width: 114.h),
                            ),
                            getVerSpace(28.h),
                            getCustomFont(
                                "No Notifications Yet!", 20.sp, Colors.black, 1,
                                fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                            getVerSpace(8.h),
                            getMultilineCustomFont(
                                "We’ll notify you when something arrives.",
                                16.sp,
                                Colors.black,
                                fontWeight: FontWeight.w500,
                                txtHeight: 1.5.h)
                          ],
                        ),
                      ))
                  : Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerSpace(20.h),
                        getPaddingWidget(
                          EdgeInsets.symmetric(horizontal: 20.h),
                          getCustomFont("Today", 16.sp, greyColor, 1,
                              fontWeight: FontWeight.w500, txtHeight: 1.5.h),
                        ),
                        getVerSpace(10.h),
                        Expanded(
                          flex: 1,
                          child: ListView.separated(
                              itemCount: notificationLists.length,
                              separatorBuilder: (context, index) {
                                return getPaddingWidget(
                                    EdgeInsets.symmetric(horizontal: 20.h),
                                    Container(
                                      height: 1.h,
                                      color: dividerColor,
                                      width: double.infinity,
                                    ));
                              },
                              itemBuilder: (context, index) {
                                ModalNotification modalNotification =
                                    notificationLists[index];
                                return Container(
                                  color: index == 0 || index == 1
                                      ? lightColor
                                      : Colors.white,
                                  child: getPaddingWidget(
                                    EdgeInsets.symmetric(
                                        horizontal: 20.h, vertical: 20.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60.h,
                                                width: 60.h,
                                                decoration: BoxDecoration(
                                                    color: modalNotification
                                                        .color!
                                                        .toColor(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22.h)),
                                                padding: EdgeInsets.all(18.h),
                                                child: getSvgImage(
                                                    "notification-image.svg",
                                                    color: Colors.white,
                                                    width: 24.h,
                                                    height: 24.h),
                                              ),
                                              getHorSpace(12.h),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    getCustomFont(
                                                        modalNotification
                                                                .name ??
                                                            " ",
                                                        18.sp,
                                                        Colors.black,
                                                        1,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        txtHeight: 1.5.h),
                                                    getVerSpace(4.h),
                                                    getCustomFont(
                                                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                                        16.sp,
                                                        Colors.black,
                                                        1,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        txtHeight: 1.5.h)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        getCustomFont(
                                            modalNotification.time ?? '',
                                            15.sp,
                                            "#7D7883".toColor(),
                                            1,
                                            fontWeight: FontWeight.w400,
                                            txtHeight: 1.46.h)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
