import '../../../app/view/create_event/create_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/appBar/bar.dart';
import '../../../base/appBar/item.dart';
import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../controller/controller.dart';

import 'tab/tab_favourite.dart';
import 'tab/tab_home.dart';
import 'tab/tab_profile.dart';
import 'tab/tab_ticket.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  void backClick() {
    Constant.closeApp();
  }

  CreateEventController createEventController =
      Get.put(CreateEventController());
  HomeController controller = Get.put(HomeController());
  static final List<Widget> _widgetOptions = <Widget>[
    const TabHome(),
    const TabFavourite(),
    const CreateEventScreen(),
    const TabTicket(),
    const TabProfile()
  ];
  TabController? tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return WillPopScope(
      onWillPop: () async {
        if (controller.index.value != 0) {
          controller.onChange(0.obs);
        } else {
          backClick();
        }

        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: _buildBottomBar(),
        body: SafeArea(
          child: GetX<HomeController>(
            init: HomeController(),
            builder: (controller) => _widgetOptions[controller.index.value],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) => ConvexAppBar(
        controller:tabcontroller,
        items: [
          TabItem(
              icon: getSvgImage("home.svg", height: 24.h, width: 24.h),
              activeIcon:
                  getSvgImage("home_bold.svg", height: 24.h, width: 24.h)),
          TabItem(
              icon: getSvgImage("favourite.svg", height: 24.h, width: 24.h),
              activeIcon:
                  getSvgImage("favourite_bold.svg", height: 24.h, width: 24.h)),
          TabItem(
              icon: getSvgImage("add.svg", height: 24.h, width: 24.h),
              activeIcon: getSvgImage("add.svg", height: 24.h, width: 24.h)),
          TabItem(
              icon: getSvgImage("ticket.svg", height: 24.h, width: 24.h),
              activeIcon:
                  getSvgImage("ticket_bold.svg", height: 24.h, width: 24.h)),
          TabItem(
              icon: getSvgImage("profile.svg", height: 24.h, width: 24.h),
              activeIcon:
                  getSvgImage("profile_bold.svg", height: 24.h, width: 24.h))
        ],
        height: 88.h,
        elevation: 5,
        color: accentColor,
        top: -33.h,
        curveSize: 85.h,
        initialActiveIndex: controller.index.value,
        activeColor: accentColor,
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        onTap: (count) {
          controller.onChange(count.obs);
        },
      ),
    );
  }
}
