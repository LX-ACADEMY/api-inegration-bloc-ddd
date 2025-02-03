part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.nameChanged(String name) = _nameChanged;
  const factory SignUpFormEvent.emailChanged(String email) = _EmailChanged;
  const factory SignUpFormEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory SignUpFormEvent.signUpButtonPressed() = _SignUpButtonPressed;
}
