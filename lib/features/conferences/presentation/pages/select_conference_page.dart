import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_login/base/color_data.dart';
import 'package:test_login/base/constant.dart';
import 'package:test_login/base/widget_utils.dart';
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart';
import 'package:test_login/features/conferences/domain/entities/conference.dart';

/// Page for selecting a conference.
class SelectConferencePage extends StatelessWidget {
  const SelectConferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getToolBar(
        () => Navigator.of(context).pop(),
        title: getSvgImage("event_logo.svg", width: 72.h, height: 35.h),
      ),
      body: SafeArea(
        child: BlocBuilder<ConferenceBloc, ConferenceState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              loaded: (conferences, selected) {
                return Column(
                  children: [
                    getVerSpace(40.h),
                    getCustomFont(
                      "Select Conference",
                      24.sp,
                      Colors.black,
                      1,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                    getVerSpace(24.h),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        itemCount: conferences.length,
                        itemBuilder: (context, index) {
                          final conference = conferences[index];
                          final isSelected = selected?.id == conference.id;
                          return GestureDetector(
                            onTap: () {
                              context.read<ConferenceBloc>().add(
                                    ConferenceEvent.selectConference(
                                      conference,
                                    ),
                                  );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16.h),
                              padding: EdgeInsets.all(16.h),
                              decoration: BoxDecoration(
                                color: isSelected ? accentColor : Colors.white,
                                borderRadius: BorderRadius.circular(16.h),
                                border: Border.all(
                                  color: isSelected ? accentColor : Colors.grey,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          8.h,
                                        ),
                                        child: Image.asset(
                                          conference.logoUrl,
                                          width: 50.h,
                                          height: 50.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      if (conference.isDemo)
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 4.w,
                                              vertical: 2.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(4.h),
                                            ),
                                            child: Text(
                                              "DEMO",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  getHorSpace(16.h),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        getCustomFont(
                                          conference.name,
                                          16.sp,
                                          isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          1,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        getVerSpace(4.h),
                                        getCustomFont(
                                          conference.location,
                                          14.sp,
                                          isSelected
                                              ? Colors.white
                                              : Colors.grey,
                                          1,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isSelected)
                                    const Icon(Icons.check_circle,
                                        color: Colors.white),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              orElse: () => const Center(child: Text("Select a conference")),
            );
          },
        ),
      ),
    );
  }
}
