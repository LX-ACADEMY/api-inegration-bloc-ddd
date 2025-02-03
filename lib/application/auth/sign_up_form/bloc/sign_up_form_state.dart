part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required bool isloading,
    required SignUpCredencial signUpCredencial,
    required TokenModel? authToken,
    required Option<Either<AuthFailure, TokenModel>> failureOrSuccessOption,
  }) = _SignUpFormState;
  factory SignUpFormState.initial() => SignUpFormState(
        isloading: false,
        signUpCredencial: SignUpCredencial.empty(),
        authToken: null,
        failureOrSuccessOption: none(),
      );
}
