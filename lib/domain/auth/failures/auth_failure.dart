import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.clientFailure({
    required String message,
  }) = _ClientFailure;
  const factory AuthFailure.serverFailure({
    required String message,
  }) = _ServerFailure;
}
