part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _InitialAuthState;
  const factory AuthState.loading() = _LoadingAuthState;
     
  const factory AuthState.error() = _ErrorAuthState;
  const factory AuthState.success() = _SuccessAuthState;
// const factory  AuthState.displayspecificauth()=_DisplaySpecificAuthState;

}



        
      
      
      
      
            