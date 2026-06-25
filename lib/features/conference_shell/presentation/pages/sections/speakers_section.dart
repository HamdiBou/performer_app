import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';
import '../../../../conferences/presentation/bloc/conference_bloc.dart';
import '../../../../speakers/domain/entities/speaker.dart';

class SpeakersSection extends StatelessWidget {
  const SpeakersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConferenceBloc, ConferenceState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (conferences, selected) {
            if (selected == null || selected.speakers == null || selected.speakers!.isEmpty) {
              return Center(
                child: getCustomFont(
                  "No speakers listed yet.",
                  16.sp,
                  greyColor,
                  1,
                  fontWeight: FontWeight.w500,
                ),
              );
            }

            final speakers = selected.speakers!;

            return GridView.builder(
              padding: EdgeInsets.all(20.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.75,
              ),
              itemCount: speakers.length,
              itemBuilder: (context, index) {
                final speaker = speakers[index];
                return _buildSpeakerCard(context, speaker);
              },
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildSpeakerCard(BuildContext context, Speaker speaker) {
    return InkWell(
      onTap: () => _showSpeakerDetails(context, speaker),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.h),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: speaker.id,
              child: Container(
                height: 90.h,
                width: 90.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: accentColor.withOpacity(0.2), width: 3.h),
                ),
                child: ClipOval(
                  child: Image.network(
                    speaker.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.person, size: 50.h, color: greyColor),
                  ),
                ),
              ),
            ),
            getVerSpace(12.h),
            getCustomFont(
              speaker.name,
              16.sp,
              Colors.black,
              1,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            getVerSpace(4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: getCustomFont(
                speaker.role,
                12.sp,
                greyColor,
                2,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSpeakerDetails(BuildContext context, Speaker speaker) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 0.7.sh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.h)),
        ),
        padding: EdgeInsets.all(24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.h),
                ),
              ),
            ),
            getVerSpace(24.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: NetworkImage(speaker.imageUrl),
                  onBackgroundImageError: (_, __) {},
                ),
                getHorSpace(16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomFont(
                        speaker.name,
                        22.sp,
                        Colors.black,
                        1,
                        fontWeight: FontWeight.w700,
                      ),
                      getCustomFont(
                        speaker.role,
                        14.sp,
                        accentColor,
                        2,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            getVerSpace(24.h),
            getCustomFont(
              "Biography",
              18.sp,
              Colors.black,
              1,
              fontWeight: FontWeight.w700,
            ),
            getVerSpace(8.h),
            Expanded(
              child: SingleChildScrollView(
                child: getCustomFont(
                  speaker.bio,
                  15.sp,
                  Colors.black87,
                  100,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            getVerSpace(16.h),
            SizedBox(
              width: double.infinity,
              child: getButton(context, accentColor, "View Sessions", Colors.white, () {
                Navigator.pop(context);
                // In a real app, this might navigate to a filtered schedule view
              }, 16.sp, weight: FontWeight.w700, borderRadius: BorderRadius.circular(16.h), buttonHeight: 56.h),
            ),
          ],
        ),
      ),
    );
  }
}
