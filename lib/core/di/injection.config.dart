// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:test_login/core/di/injection.dart' as _i78;
import 'package:test_login/core/network/api_client.dart' as _i92;
import 'package:test_login/core/routing/app_router.dart' as _i707;
import 'package:test_login/features/auth/data/datasources/auth_data_source.dart'
    as _i706;
import 'package:test_login/features/auth/data/repositories/auth_repository_impl.dart'
    as _i189;
import 'package:test_login/features/auth/domain/repositories/auth_repository.dart'
    as _i526;
import 'package:test_login/features/auth/presentation/bloc/auth_bloc.dart'
    as _i685;
import 'package:test_login/features/certificate/data/repositories/certificate_repository_impl.dart'
    as _i95;
import 'package:test_login/features/certificate/domain/repositories/certificate_repository.dart'
    as _i199;
import 'package:test_login/features/certificate/presentation/bloc/certificate_bloc.dart'
    as _i946;
import 'package:test_login/features/conference_shell/data/repositories/conference_shell_repository_impl.dart'
    as _i1007;
import 'package:test_login/features/conference_shell/domain/repositories/conference_shell_repository.dart'
    as _i309;
import 'package:test_login/features/conference_shell/presentation/bloc/shell_bloc.dart'
    as _i561;
import 'package:test_login/features/conferences/data/repositories/conference_repository_impl.dart'
    as _i860;
import 'package:test_login/features/conferences/domain/repositories/conference_repository.dart'
    as _i231;
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart'
    as _i691;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i309.ConferenceShellRepository>(
      () => _i1007.ConferenceShellRepositoryImpl(),
    );
    gh.lazySingleton<_i199.CertificateRepository>(
      () => _i95.CertificateRepositoryImpl(),
    );
    gh.lazySingleton<_i92.ApiClient>(() => _i92.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i231.ConferenceRepository>(
      () => _i860.ConferenceRepositoryImpl(),
    );
    gh.factory<_i561.ShellBloc>(
      () => _i561.ShellBloc(gh<_i309.ConferenceShellRepository>()),
    );
    gh.factory<_i946.CertificateBloc>(
      () => _i946.CertificateBloc(gh<_i199.CertificateRepository>()),
    );
    gh.factory<_i691.ConferenceBloc>(
      () => _i691.ConferenceBloc(gh<_i231.ConferenceRepository>()),
    );
    gh.lazySingleton<_i706.AuthDataSource>(
      () => _i706.AuthDataSourceImpl(
        gh<_i116.GoogleSignIn>(),
        gh<_i92.ApiClient>(),
      ),
    );
    gh.lazySingleton<_i526.AuthRepository>(
      () => _i189.AuthRepositoryImpl(gh<_i706.AuthDataSource>()),
    );
    gh.factory<_i685.AuthBloc>(
      () => _i685.AuthBloc(gh<_i526.AuthRepository>()),
    );
    gh.lazySingleton<_i707.AppRouter>(
      () => _i707.AppRouter(gh<_i685.AuthBloc>(), gh<_i691.ConferenceBloc>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i78.RegisterModule {}
