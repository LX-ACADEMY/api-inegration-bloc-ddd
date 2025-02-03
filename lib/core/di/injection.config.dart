// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_app/application/auth/sign_in%20_form/sign_in_form_bloc.dart'
    as _i246;
import 'package:todo_app/application/auth/sign_up_form/bloc/sign_up_form_bloc.dart'
    as _i318;
import 'package:todo_app/domain/auth/i_auth_repository.dart' as _i1062;
import 'package:todo_app/infrastructure/auth/auth_repository.dart' as _i125;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i246.SignInFormBloc>(() => _i246.SignInFormBloc());
    gh.lazySingleton<_i1062.IAuthRepository>(() => _i125.AuthRepository());
    gh.factory<_i318.SignUpFormBloc>(
        () => _i318.SignUpFormBloc(gh<_i1062.IAuthRepository>()));
    return this;
  }
}
