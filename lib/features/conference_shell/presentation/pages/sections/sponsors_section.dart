import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../base/color_data.dart';
import '../../../../../base/widget_utils.dart';
import '../../../../conferences/presentation/bloc/conference_bloc.dart';
import '../../../../sponsors/domain/entities/sponsor.dart';

class SponsorsSection extends StatelessWidget {
  const SponsorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConferenceBloc, ConferenceState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (conferences, selected) {
            if (selected == null || selected.sponsors == null || selected.sponsors!.isEmpty) {
              return Center(
                child: getCustomFont(
                  "No sponsors yet.",
                  16.sp,
                  greyColor,
                  1,
                  fontWeight: FontWeight.w500,
                ),
              );
            }

            final sponsors = selected.sponsors!;
            final groupedSponsors = <String, List<Sponsor>>{};
            for (var sponsor in sponsors) {
              if (!groupedSponsors.containsKey(sponsor.tier)) {
                groupedSponsors[sponsor.tier] = [];
              }
              groupedSponsors[sponsor.tier]!.add(sponsor);
            }

            final tiers = ["Platinum", "Gold", "Silver", "Partner"];

            return ListView(
              padding: EdgeInsets.all(20.h),
              children: tiers.map((tier) {
                final tierSponsors = groupedSponsors[tier];
                if (tierSponsors == null || tierSponsors.isEmpty) {
                  return const SizedBox.shrink();
                }
                return _buildTierSection(tier, tierSponsors);
              }).toList(),
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildTierSection(String tier, List<Sponsor> sponsors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: _getTierColor(tier),
                borderRadius: BorderRadius.circular(2.h),
              ),
            ),
            getHorSpace(8.w),
            getCustomFont(
              "$tier Sponsors",
              18.sp,
              Colors.black,
              1,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        getVerSpace(16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: tier == "Platinum" ? 1 : 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: tier == "Platinum" ? 2.5 : 1.5,
          ),
          itemCount: sponsors.length,
          itemBuilder: (context, index) {
            final sponsor = sponsors[index];
            return Container(
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.h),
                border: Border.all(color: shadowColor, width: 1.h),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Image.network(
                sponsor.logoUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: getCustomFont(
                    sponsor.name,
                    16.sp,
                    Colors.black,
                    1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          },
        ),
        getVerSpace(32.h),
      ],
    );
  }

  Color _getTierColor(String tier) {
    switch (tier) {
      case "Platinum":
        return const Color(0xFF607D8B);
      case "Gold":
        return const Color(0xFFFFC107);
      case "Silver":
        return const Color(0xFF9E9E9E);
      default:
        return accentColor;
    }
  }
}
