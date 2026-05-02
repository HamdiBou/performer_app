import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart';
import 'package:test_login/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_login/features/conferences/domain/entities/conference.dart';
import '../../controller/conference_controller.dart';
import '../../../base/color_data.dart';
import '../../../base/pref_data.dart';
import '../../../base/widget_utils.dart';
import '../../../base/constant.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/data/api_config.dart';

class ConferenceDescriptionScreen extends StatelessWidget {
  final ConferenceModel conference;

  const ConferenceDescriptionScreen({Key? key, required this.conference})
    : super(key: key);

  void _handleEnterPressed(BuildContext context) async {
    if (conference.isDemo || conference.id == 'demo') {
      context.read<ConferenceBloc>().add(
        ConferenceEvent.selectConference(conference.toEntity()),
      );

      await context.read<ConferenceBloc>().stream.firstWhere(
        (state) => state is ConferenceLoaded && state.selected != null,
      );

      if (!context.mounted) return;
      context.go('/');
      return;
    }

    final authState = context.read<AuthBloc>().state;
    final isAuth = authState.maybeWhen(
      authenticated: (_) => true,
      orElse: () => false,
    );

    if (!isAuth) {
      context.go('/login');
      return;
    }

    await PrefData.setBaseUrl(conference.performerUrl);
    await PrefData.setSelectedConference(conference.id, conference.name);

    if (!context.mounted) return;

    // Dispatch selection to ConferenceBloc to trigger router update
    context.read<ConferenceBloc>().add(
      ConferenceEvent.selectConference(conference.toEntity()),
    );
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getToolBar(
        () {
          context.go('/public');
        },
        title: getCustomFont(
          "Conference Details",
          24.sp,
          Colors.black,
          1,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getDivider(dividerColor, 1.h),
              getVerSpace(24.h),
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                  color: Colors.grey[200],
                ),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.h),
                  child: Image.network(
                    conference.logoUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.business, size: 80.h, color: Colors.grey),
                  ),
                ),
              ),
              getVerSpace(24.h),
              getCustomFont(
                conference.name,
                24.sp,
                Colors.black,
                1,
                fontWeight: FontWeight.w700,
              ),
              getVerSpace(12.h),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 18.sp,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8.w),
                  getCustomFont(
                    conference.date,
                    16.sp,
                    Colors.black54,
                    1,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              getVerSpace(8.h),
              Row(
                children: [
                  Icon(Icons.access_time, size: 18.sp, color: Colors.black54),
                  SizedBox(width: 8.w),
                  getCustomFont(
                    conference.time,
                    16.sp,
                    Colors.black54,
                    1,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              getVerSpace(8.h),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18.sp,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8.w),
                  getCustomFont(
                    conference.location,
                    16.sp,
                    Colors.black54,
                    1,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              getVerSpace(16.h),
              getDivider(dividerColor, 1.h),
              getVerSpace(16.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getMultilineCustomFont(
                        conference.description,
                        16.sp,
                        Colors.black54,
                        fontWeight: FontWeight.w500,
                        txtHeight: 1.5,
                      ),
                      getVerSpace(16.h),
                      if (conference.websiteUrl.isNotEmpty) ...[
                        getCustomFont(
                          "Website: ${conference.websiteUrl}",
                          16.sp,
                          Colors.blue,
                          1,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              getButton(
                context,
                accentColor,
                "Enter Conference",
                Colors.white,
                () => _handleEnterPressed(context),
                18.sp,
                weight: FontWeight.w700,
                buttonHeight: 60.h,
                borderRadius: BorderRadius.circular(22.h),
              ),
              getVerSpace(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
