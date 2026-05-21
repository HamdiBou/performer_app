import '../../../app/controller/controller.dart';
import '../../../app/routes/app_routes.dart';
import '../../../base/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/constant.dart';
import '../../../base/pref_data.dart';
import '../../../base/widget_utils.dart';

import '../../../../features/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController controller;

  void backClick() {
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(LoginController(), permanent: false);
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) backClick();
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (user) {
              Constant.sendToNext(context, Routes.homeRoute);
            },
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
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
                  "Log In",
                  24.sp,
                  Colors.black,
                  1,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  txtHeight: 1.5.h,
                ),
                getVerSpace(8.h),
                getMultilineCustomFont(
                  "Use your credentials and login to your account",
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
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x2B9CC3C6),
                          blurRadius: 24,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Form(
                      key: controller.loginFormKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getVerSpace(40.h),
                            getDefaultTextFiledWithLabel(
                              context,
                              "Email",
                              controller.emailController,
                              validator: controller.emailValidator,
                            ),
                            getVerSpace(24.h),
                            getDefaultTextFiledWithLabel(
                              context,
                              "Password",
                              controller.passwordController,
                              isPass: true,
                              validator: controller.passwordValidator,
                            ),
                            getVerSpace(40.h),
                            getButton(
                              context,
                              accentColor,
                              "Login",
                              Colors.white,
                              () async {
                                if (controller.loginFormKey.currentState!
                                    .validate()) {
                                  final conferenceId =
                                      await PrefData.getSelectedConferenceId();
                                  if (conferenceId == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Please select a conference first",
                                        ),
                                      ),
                                    );
                                    return;
                                  }
                                  context.read<AuthBloc>().add(
                                    AuthEvent.signInWithEmail(
                                      email: controller.emailController.text,
                                      password:
                                          controller.passwordController.text,
                                      conferenceId: conferenceId,
                                    ),
                                  );
                                }
                              },
                              18.sp,
                              weight: FontWeight.w700,
                              buttonHeight: 60.h,
                              borderRadius: BorderRadius.circular(22.h),
                            ),
                            getVerSpace(24.h),
                            getCustomFont(
                              "Or login with",
                              14.sp,
                              Colors.grey,
                              1,
                              textAlign: TextAlign.center,
                            ),
                            getVerSpace(24.h),
                            getButton(
                              context,
                              Colors.white,
                              "Google",
                              Colors.black,
                              () {
                                context.read<AuthBloc>().add(
                                  const AuthEvent.signInWithGoogle(),
                                );
                              },
                              18.sp,
                              weight: FontWeight.w700,
                              buttonHeight: 60.h,
                              borderRadius: BorderRadius.circular(22.h),
                              isBorder: true,
                              image: "google.svg",
                              isIcon: true,
                              borderColor: Colors.grey,
                            ),
                            getVerSpace(40.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
