import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/constants/api_endpoints.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/domain/auth/failures/auth_failure.dart';
import 'package:todo_app/domain/auth/i_auth_repository.dart';
import 'package:todo_app/domain/auth/sign_in_credencial/credential.dart';
import 'package:todo_app/domain/auth/sign_up_credencial/sign_up_credencial.dart';
import 'package:todo_app/domain/models/token_model/token_model.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  @override
  Future<Either<AuthFailure, TokenModel>> signUp(
    SignUpCredencial credential,
  ) async {
    try {
      final dio = getIt<Dio>();

      final response = await dio.post(
        ApiEndpoints.signup,
        data: credential.toJson(),
      );

      if (response.statusCode == 201) {
        return right(TokenModel.fromJson(response.data));
      }

      return left(
        AuthFailure.clientFailure(message: response.data['message']),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return left(
          AuthFailure.clientFailure(message: e.response?.data['message']),
        );
      }
      return left(
        AuthFailure.serverFailure(message: e.toString()),
      );
    } catch (e) {
      return left(
        AuthFailure.serverFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<AuthFailure, TokenModel>> signin(Credential credential) async {
    try {
      final dio = getIt<Dio>();

      final response = await dio.post(
        ApiEndpoints.signin,
        data: credential.toJson(),
      );

      if (response.statusCode == 200) {
        return right(TokenModel.fromJson(response.data));
      }

      return left(
        AuthFailure.clientFailure(message: response.data['message']),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return left(
          AuthFailure.clientFailure(message: e.response?.data['message']),
        );
      }
      return left(
        AuthFailure.serverFailure(message: e.toString()),
      );
    } catch (e) {
      return left(
        AuthFailure.serverFailure(message: e.toString()),
      );
    }
  }
}
