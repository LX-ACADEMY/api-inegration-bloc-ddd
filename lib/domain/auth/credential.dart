import 'package:freezed_annotation/freezed_annotation.dart';
part 'credential.freezed.dart';
part 'credential.g.dart';

@freezed
class Credential with _$Credential {
  const factory Credential({
    required String email,
    required String password,
  }) = _Credential;
  factory Credential.empty() => const Credential(
        email: '',
        password: '',
      );

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
}
