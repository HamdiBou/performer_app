import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injection.dart';
import 'core/routing/app_router.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/conferences/presentation/bloc/conference_bloc.dart';
import 'features/conference_shell/presentation/bloc/shell_bloc.dart';
import 'features/certificate/presentation/bloc/certificate_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>()..add(AppStarted()),
        ),
        BlocProvider<ConferenceBloc>(
          create: (context) =>
              getIt<ConferenceBloc>()..add(LoadSelectedConference()),
        ),
        BlocProvider<ShellBloc>(create: (context) => getIt<ShellBloc>()),
        BlocProvider<CertificateBloc>(
          create: (context) => getIt<CertificateBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: getIt<AppRouter>().router,
        );
      },
    );
  }
}
