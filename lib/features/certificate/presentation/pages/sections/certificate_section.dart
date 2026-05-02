import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_login/base/color_data.dart';
import 'package:test_login/base/widget_utils.dart';
import 'package:test_login/features/certificate/presentation/bloc/certificate_bloc.dart';
import 'package:test_login/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_login/features/auth/domain/entities/user.dart';
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart';
import 'package:test_login/features/conferences/domain/entities/conference.dart';

class CertificateSection extends StatelessWidget {
  const CertificateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CertificateBloc, CertificateState>(
      listener: (context, state) {
        if (state is CertificateGenerated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Certificate generated! Save to gallery?")),
          );
        } else if (state is CertificateSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Certificate saved to gallery!")),
          );
        } else if (state is CertificateError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      child: BlocBuilder<CertificateBloc, CertificateState>(
        builder: (context, state) {
          User? user;
          final authState = context.read<AuthBloc>().state;
          if (authState is Authenticated) {
            user = authState.user;
          }

          Conference? conference;
          final confState = context.read<ConferenceBloc>().state;
          if (confState is ConferenceLoaded) {
            conference = confState.selected;
          }

          if (user == null || conference == null) {
            return const Center(
              child: Text("Please login and select a conference"),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_membership, size: 100.r, color: Colors.grey),
                SizedBox(height: 20.h),
                Text(
                  "Your Certificate",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Generate your official participation certificate",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                if (state is CertificateLoading)
                  const CircularProgressIndicator()
                else if (state is CertificateGenerated)
                  ElevatedButton(
                    onPressed: () {
                      context.read<CertificateBloc>().add(
                        SaveCertificate(state.certificate.filePath),
                      );
                    },
                    child: const Text("Save to Gallery"),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      context.read<CertificateBloc>().add(
                        GenerateCertificate(
                          userId: user!.id,
                          userName: user!.displayName,
                          conferenceId: conference!.id,
                          conferenceName: conference!.name,
                        ),
                      );
                    },

                    child: const Text("Generate Certificate"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
