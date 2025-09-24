part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {

  const factory AuthEvent.initial() =_InitialAuthEvent;
  const factory AuthEvent.verifyPhoneCheck(String phone) = _VerifyPhoneCheckAuthEvent;
  const factory AuthEvent.verifyPhone(String phone) = _VerifyPhoneAuthEvent;
  const factory AuthEvent.verifyEmail(String email) = _VerifyEmailAuthEvent;
  const factory AuthEvent.verifyEmailCheck() = _VerifyEmailCheckAuthEvent;
  const factory AuthEvent.logout() = _LogoutAuthEvent;
  const factory AuthEvent.load() = _LoadAuthEvent;
  const factory AuthEvent.authenticated() = _AuthenticatedAuthEvent;
  const factory AuthEvent.reset() = _ResetAuthEvent;
  const factory AuthEvent.forgotPwd() = _ForgotPwdAuthEvent;
  const factory AuthEvent.save() = _SaveAuthEvent;
  const factory AuthEvent.login(String email,String phonenumber,String password) = _LoginAuthEvent;
  const factory AuthEvent.refreshToken() = _RefreshTokenAuthEvent;
  const factory AuthEvent.error() = _ErrorAuthEvent;
  const factory AuthEvent.register(String email,String password,String phonenumber,String countrycode,String referalcode)=_RegisterAuthEvent;
  const factory AuthEvent.tfa() = _TFaAuthEvent;
const factory AuthEvent.updatetradingpassword(String oldpassword ,String newpassword,   String confirmpassword)=_UpdateTradingPasswordAuthEvent;

}

