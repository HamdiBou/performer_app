import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_login/base/color_data.dart';
import 'package:test_login/base/constant.dart';
import 'package:test_login/base/widget_utils.dart';
import 'package:test_login/features/auth/presentation/bloc/auth_bloc.dart';

/// Page for user authentication via Google Sign-In.
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.go('/public');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: getToolBar(
          () => context.go('/public'),
          title: getSvgImage("event_logo.svg", width: 72.h, height: 35.h),
        ),
        body: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                error: (message) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                },
                orElse: () {},
              );
            },
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
                  "Use your Google account to login to your account",
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getVerSpace(40.h),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );
                            return getButton(
                              context,
                              Colors.white,
                              isLoading ? "Signing in..." : "Google",
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
                            );
                          },
                        ),
                        getVerSpace(40.h),
                      ],
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
