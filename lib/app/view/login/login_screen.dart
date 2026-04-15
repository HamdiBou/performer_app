import '../../../app/controller/controller.dart';
import '../../../app/routes/app_routes.dart';
import '../../../base/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/constant.dart';
import '../../../base/pref_data.dart';
import '../../../base/widget_utils.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../app/data/api_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController controlller;
  late GoogleSignIn _googleSignIn;
  bool _googleSignInInitialized = false;
  static bool _googleSignInInitializing = false;

  void backClick() {
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    controlller = Get.put(LoginController(), permanent: false);
    _googleSignIn = GoogleSignIn.instance;

    // Initialize Google Sign-In with credentials from .env
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    // Prevent multiple initialization attempts
    if (_googleSignInInitializing || _googleSignInInitialized) {
      return;
    }

    _googleSignInInitializing = true;

    try {
      print('🔧 Initializing Google Sign-In...');
      print('   Client ID: ${dotenv.env['GOOGLE_CLIENT_ID']}');
      print('   Server Client ID: ${dotenv.env['GOOGLE_SERVER_CLIENT_ID']}');

      await _googleSignIn.initialize(
        clientId: dotenv.env['GOOGLE_CLIENT_ID'],
        serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'],
      );

      setState(() {
        _googleSignInInitialized = true;
      });
      print('✅ Google Sign-In initialized successfully');
    } catch (e) {
      print('❌ Error initializing Google Sign-In: $e');
      // Still mark as initialized to prevent repeated attempts
      if (mounted) {
        setState(() {
          _googleSignInInitialized = false;
        });
      }
    } finally {
      _googleSignInInitializing = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return WillPopScope(
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
                    boxShadow: [
                      BoxShadow(
                        color: "#2B9CC3C6".toColor(),
                        blurRadius: 24,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Form(
                    key: controlller.loginFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getVerSpace(40.h),
                          getDefaultTextFiledWithLabel(
                            context,
                            "Email",
                            controlller.emailController,
                            validator: (value) =>
                                controlller.emailvalidator(value),
                          ),
                          getVerSpace(24.h),
                          getDefaultTextFiledWithLabel(
                            context,
                            "Password",
                            controlller.passwordController,
                            isPass: true,
                            validator: (value) =>
                                controlller.passwordvalidator(value),
                          ),
                          getVerSpace(40.h),
                          getButton(
                            context,
                            accentColor,
                            "Login",
                            Colors.white,
                            () async {
                              if (controlller.loginFormKey.currentState!
                                  .validate()) {
                                try {
                                  final loginUrl =
                                      "${ApiConfig.baseUrl}/auth/login";
                                  print('🔐 Login Request:');
                                  print('URL: $loginUrl');
                                  print(
                                    'Email: ${controlller.emailController.text}',
                                  );

                                  final response = await http
                                      .post(
                                        Uri.parse(loginUrl),
                                        headers: {
                                          "Content-Type": "application/json",
                                        },
                                        body: json.encode({
                                          "email":
                                              controlller.emailController.text,
                                          "password": controlller
                                              .passwordController
                                              .text,
                                        }),
                                      )
                                      .timeout(
                                        const Duration(seconds: 10),
                                        onTimeout: () {
                                          print('✗ Login timeout');
                                          throw Exception('Request timeout');
                                        },
                                      );

                                  print(
                                    '📱 Response Status: ${response.statusCode}',
                                  );
                                  print('📱 Response: ${response.body}');

                                  if (response.statusCode == 200 ||
                                      response.statusCode == 201) {
                                    print('✓ Login successful');
                                    await PrefData.setIsSignIn(true);
                                    Constant.sendToNext(
                                      context,
                                      Routes.homeScreenRoute,
                                    );
                                  } else {
                                    print(
                                      '✗ Login failed: ${response.statusCode}',
                                    );
                                    if (mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Login failed: ${response.statusCode} - ${response.body}",
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                } catch (e) {
                                  print('✗ Login Error: $e');
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Login error: $e"),
                                      ),
                                    );
                                  }
                                }
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
                            () async {
                              if (!_googleSignInInitialized) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Google Sign-In initializing... Please try again",
                                    ),
                                  ),
                                );
                                return;
                              }
                              try {
                                // Sign in and get authentication details
                                final googleUser = await _googleSignIn
                                    .authenticate();
                                final GoogleSignInAuthentication googleAuth =
                                    await googleUser.authentication;

                                print('🔐 Google Sign-In Request:');
                                print('ID Token: ${googleAuth.idToken}');

                                final googleLoginUrl =
                                    "${ApiConfig.baseUrl}/auth/google";
                                print('URL: $googleLoginUrl');

                                final response = await http
                                    .post(
                                      Uri.parse(googleLoginUrl),
                                      headers: {
                                        "Content-Type": "application/json",
                                      },
                                      body: json.encode({
                                        "id_token": googleAuth.idToken,
                                      }),
                                    )
                                    .timeout(
                                      const Duration(seconds: 10),
                                      onTimeout: () {
                                        print('✗ Google login timeout');
                                        throw Exception('Request timeout');
                                      },
                                    );

                                print(
                                  '📱 Response Status: ${response.statusCode}',
                                );
                                print('📱 Response: ${response.body}');

                                if (response.statusCode == 200 ||
                                    response.statusCode == 201) {
                                  print('✓ Google login successful');
                                  await PrefData.setIsSignIn(true);
                                  if (mounted) {
                                    Constant.sendToNext(
                                      context,
                                      Routes.homeScreenRoute,
                                    );
                                  }
                                } else {
                                  print(
                                    '✗ Google login failed: ${response.statusCode}',
                                  );
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Google login failed: ${response.statusCode}",
                                        ),
                                      ),
                                    );
                                  }
                                }
                              } catch (e) {
                                print('✗ Google Sign-In Error: $e');
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Google Sign-In error: $e"),
                                    ),
                                  );
                                }
                              }
                            },
                            18.sp,
                            weight: FontWeight.w700,
                            buttonHeight: 60.h,
                            borderRadius: BorderRadius.circular(22.h),
                            isBorder: true,
                            image: "google.svg",
                            isIcon: false,
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
      onWillPop: () async {
        backClick();
        return false;
      },
    );
  }
}
