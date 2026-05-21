import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/features/certificate/presentation/bloc/certificate_bloc.dart';
import 'package:test_login/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart';

class CertificateSection extends StatelessWidget {
  const CertificateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CertificateBloc, CertificateState>(
      listener: (context, state) {
        state.maybeWhen(
          generated: (cert) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Certificate generated! Save to gallery?"),
              ),
            );
          },
          saved: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Certificate saved to gallery!")),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<CertificateBloc, CertificateState>(
        builder: (context, state) {
          final user = context.read<AuthBloc>().state.maybeWhen(
            authenticated: (u) => u,
            orElse: () => null,
          );
          final conference = context.read<ConferenceBloc>().state.maybeWhen(
            loaded: (_, selected) => selected,
            orElse: () => null,
          );

          if (conference == null || (user == null && !conference.isDemo)) {
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
                state.maybeWhen(
                  loading: () => const CircularProgressIndicator(),
                  generated: (cert) => ElevatedButton(
                    onPressed: () {
                      context.read<CertificateBloc>().add(
                        CertificateEvent.save(cert.filePath),
                      );
                    },
                    child: const Text("Save to Gallery"),
                  ),
                  orElse: () => ElevatedButton(
                    onPressed: user == null
                        ? null
                        : () {
                            context.read<CertificateBloc>().add(
                              CertificateEvent.generate(
                                userId: user!.id,
                                userName: user!.displayName,
                                conferenceId: conference!.id,
                                conferenceName: conference!.name,
                              ),
                            );
                          },
                    child: Text(
                      user == null
                          ? "Login to Generate Certificate"
                          : "Generate Certificate",
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
