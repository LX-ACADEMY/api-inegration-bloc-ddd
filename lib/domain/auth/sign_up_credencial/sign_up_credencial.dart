import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_credencial.freezed.dart';
part 'sign_up_credencial.g.dart';

@freezed
class SignUpCredencial with _$SignUpCredencial {
  factory SignUpCredencial({
    required String name,
    required String email,
    required String password,
  }) = _SignUpCredencial;
  factory SignUpCredencial.empty() => SignUpCredencial(
        name: "",
        email: "",
        password: "",
      );
  factory SignUpCredencial.fromJson(Map<String, dynamic> json) =>
      _$SignUpCredencialFromJson(json);
}
