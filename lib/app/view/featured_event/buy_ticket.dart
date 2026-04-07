import '../../../app/controller/controller.dart';
import '../../../app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({Key? key}) : super(key: key);

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  void backClick() {
    Constant.backToPrev(context);
  }

  BuyTicketController controller = Get.put(BuyTicketController());

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: getToolBar(
          () {
            backClick();
          },
          title: getCustomFont("Buy Ticket", 24.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, textAlign: TextAlign.center),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Divider(color: dividerColor, thickness: 1.h, height: 1.h),
              Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      getVerSpace(30.h),
                      buildTicketTypeWidget(),
                      getVerSpace(30.h),
                      Divider(
                        color: dividerColor,
                        thickness: 1.h,
                        height: 1.h,
                      ),
                      buildSeatWidget(),
                    ],
                  )),
              buildTotalWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTotalWidget(BuildContext context) {
    return getPaddingWidget(
      EdgeInsets.symmetric(horizontal: 20.h),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Total", 22.sp, Colors.black, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              getCustomFont("\$21.00", 22.sp, accentColor, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5.h)
            ],
          ),
          getVerSpace(30.h),
          getButton(context, accentColor, "Checkout", Colors.white, () {
            Constant.sendToNext(context, Routes.paymentRoute);
          }, 18.sp,
              weight: FontWeight.w700,
              buttonHeight: 60.h,
              borderRadius: BorderRadius.circular(22.h)),
          getVerSpace(30.h),
        ],
      ),
    );
  }

  Column buildSeatWidget() {
    return Column(
      children: [
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Seat", 16.sp, Colors.black, 1,
                  fontWeight: FontWeight.w600, txtHeight: 1.5.h),
              getCustomFont("64/100", 15.sp, greyColor, 1,
                  fontWeight: FontWeight.w500, txtHeight: 1.5.h)
            ],
          ),
        ),
        getVerSpace(10.h),
        GetX<BuyTicketController>(
          init: BuyTicketController(),
          builder: (controller) => Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderColor, width: 1.h),
                borderRadius: BorderRadius.circular(22.h)),
            padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: "#E8F6F6".toColor(),
                        borderRadius: BorderRadius.circular(18.h)),
                    height: 68.h,
                    width: 68.h,
                    padding: EdgeInsets.all(22.h),
                    child: getSvgImage("minus.svg", width: 24.h, height: 24.h),
                  ),
                  onTap: () {
                    if (controller.count.value == 0) {
                    } else {
                      controller.countChange(controller.count.obs.value--);
                    }
                  },
                ),
                getCustomFont(
                    controller.count.value.toString(), 22.sp, Colors.black, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                GestureDetector(
                  onTap: () {
                    controller.countChange(controller.count.obs.value++);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: "#E8F6F6".toColor(),
                        borderRadius: BorderRadius.circular(18.h)),
                    height: 68.h,
                    width: 68.h,
                    padding: EdgeInsets.all(22.h),
                    child: getSvgImage("add.svg",
                        width: 24.h, height: 24.h, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Column buildTicketTypeWidget() {
    return Column(
      children: [
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          getCustomFont("Ticket Type", 16.sp, Colors.black, 1,
              fontWeight: FontWeight.w600, txtHeight: 1.5.h),
        ),
        getVerSpace(10.h),
        GestureDetector(
          onTap: () {
            controller.onChange(0.obs);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.h),
                border: Border.all(color: borderColor, width: 1.h)),
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GetX<BuyTicketController>(
                      builder: (controller) => getSvgImage(
                          controller.select.value == 0
                              ? "checkRadio.svg"
                              : "uncheckRadio.svg",
                          width: 24.h,
                          height: 24.h),
                      init: BuyTicketController(),
                    ),
                    getHorSpace(10.h),
                    getCustomFont("VIP", 16.sp, Colors.black, 1,
                        fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                  ],
                ),
                getCustomFont("\$28.00", 18.sp, Colors.black, 1,
                    fontWeight: FontWeight.w600, txtHeight: 1.5.h)
              ],
            ),
          ),
        ),
        getVerSpace(20.h),
        GestureDetector(
          onTap: () {
            controller.onChange(1.obs);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.h),
                border: Border.all(color: borderColor, width: 1.h)),
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GetX<BuyTicketController>(
                      builder: (controller) => getSvgImage(
                          controller.select.value == 1
                              ? "checkRadio.svg"
                              : "uncheckRadio.svg",
                          width: 24.h,
                          height: 24.h),
                      init: BuyTicketController(),
                    ),
                    getHorSpace(10.h),
                    getCustomFont("Economy", 16.sp, Colors.black, 1,
                        fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                  ],
                ),
                getCustomFont("\$21.00", 18.sp, Colors.black, 1,
                    fontWeight: FontWeight.w600, txtHeight: 1.5.h)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
