import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}

/// Module to provide external dependencies
@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();
}
