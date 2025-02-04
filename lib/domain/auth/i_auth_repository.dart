import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/auth/failures/auth_failure.dart';
import 'package:todo_app/domain/auth/sign_in_credencial/credential.dart';
import 'package:todo_app/domain/auth/sign_up_credencial/sign_up_credencial.dart';
import 'package:todo_app/domain/models/token_model/token_model.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, TokenModel>> signUp(SignUpCredencial credential);
  Future<Either<AuthFailure, TokenModel>> signin(Credential credential);
}
