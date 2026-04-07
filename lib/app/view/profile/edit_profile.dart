import '../../../app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  EditProfileController controller = Get.put(EditProfileController());

  void backClick() {
    Constant.backToPrev(context);
  }

  String dropdownvalue = 'Female';

  var items = ['Female', "Male"];

  @override
  Widget build(BuildContext context) {
    controller.fullnameController.text = "Jenny Wilson";
    controller.emailController.text = "jennywilson@gmail.com";
    controller.dateController.text = "June 25, 1998";
    setStatusBarColor(Colors.white);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: getToolBar(
          () {
            backClick();
          },
          title: getCustomFont("Edit Profile", 24.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, textAlign: TextAlign.center),
        ),
        body: SafeArea(
          child: Column(
            children: [
              getDivider(
                dividerColor,
                1.h,
              ),
              Expanded(
                  flex: 1,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    primary: true,
                    shrinkWrap: true,
                    children: [
                      getVerSpace(30.h),
                      getAssetImage("profile_image.png",
                          width: 110.h, height: 110.h),
                      getVerSpace(30.h),
                      getCustomFont('Full Name', 16.sp, Colors.black, 1,
                          fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                      getVerSpace(4.h),
                      getDefaultTextFiledWithLabel(
                        context,
                        "Enter full name",
                        controller.fullnameController,
                        isEnable: false,
                        height: 60.h,
                      ),
                      getVerSpace(20.h),
                      getCustomFont('Email', 16.sp, Colors.black, 1,
                          fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                      getVerSpace(4.h),
                      getDefaultTextFiledWithLabel(
                        context,
                        "Enter email",
                        controller.emailController,
                        isEnable: false,
                        height: 60.h,
                      ),
                      getVerSpace(20.h),
                      getCustomFont('Gender', 16.sp, Colors.black, 1,
                          fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                      getVerSpace(4.h),
                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.h),
                            border: Border.all(color: borderColor, width: 1.h)),
                        padding: EdgeInsets.symmetric(horizontal: 18.h),
                        alignment: Alignment.center,
                        child: DropdownButton(
                          value: dropdownvalue,
                          underline: Container(),
                          isDense: true,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5.h,
                              fontFamily: Constant.fontsFamily),
                          icon: getSvgImage("arrow_down.svg",
                              width: 20.h, height: 20.h),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      getVerSpace(20.h),
                      getCustomFont('Date of Birth', 16.sp, Colors.black, 1,
                          fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                      getVerSpace(4.h),
                      getDefaultTextFiledWithLabel(context,
                          "Enter date of birth", controller.dateController,
                          isEnable: false,
                          height: 60.h,
                          withSufix: true,
                          suffiximage: "arrow_down.svg"),
                    ],
                  )),
              getPaddingWidget(
                EdgeInsets.symmetric(horizontal: 20.h),
                getButton(context, accentColor, "Save", Colors.white, () {
                  backClick();
                }, 18.sp,
                    weight: FontWeight.w700,
                    buttonHeight: 60.h,
                    borderRadius: BorderRadius.circular(22.h)),
              ),
              getVerSpace(30.h)
            ],
          ),
        ),
      ),
    );
  }
}
