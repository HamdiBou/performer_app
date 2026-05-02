import '../../../app/controller/controller.dart';
import '../../../app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  void backClick() {
    Constant.backToPrev(context);
  }

  ForgotController controller = Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) backClick();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: getToolBar(() {
          backClick();
        }, title: getSvgImage("event_logo.svg", width: 72.h, height: 35.h)),
        body: SafeArea(
          child: Column(
            children: [
              getDivider(dividerColor, 1.h),
              getVerSpace(60.h),
              getCustomFont(
                "Forgot Password?",
                24.sp,
                Colors.black,
                1,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                txtHeight: 1.5.h,
              ),
              getVerSpace(8.h),
              getMultilineCustomFont(
                "Use your registration email for reset password!",
                16.sp,
                Colors.black,
                txtHeight: 1.5.h,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              getVerSpace(38.h),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(34.h),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x2B9CC3C6),
                        blurRadius: 24,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Form(
                    key: controller.forgotFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        getVerSpace(30.h),
                        getCustomFont(
                          "Email",
                          16.sp,
                          Colors.black,
                          1,
                          fontWeight: FontWeight.w600,
                        ),
                        getVerSpace(7.h),
                        getDefaultTextFiledWithLabel(
                          context,
                          "Enter email",
                          controller.emailController,
                          isEnable: false,
                          height: 60.h,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return "Please enter email address.";
                            }
                            return null;
                          },
                        ),
                        getVerSpace(36.h),
                        getButton(
                          context,
                          accentColor,
                          "Submit",
                          Colors.white,
                          () {
                            Constant.sendToNext(
                              context,
                              Routes.resetPasswordRoute,
                            );
                          },
                          18.sp,
                          weight: FontWeight.w700,
                          buttonHeight: 60.h,
                          borderRadius: BorderRadius.circular(22.h),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
