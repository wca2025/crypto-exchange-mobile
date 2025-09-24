import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:async';

import '../../../data/dataproviders/auth_provider.dart';
import '../../../data/repositories/user_repository.dart';
part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<_VerifyPhoneCheckAuthEvent>((event, emit) async {
      // TODO: implement event handler
      print('testing: ');
      //emit();
    });

    on<_VerifyPhoneAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_VerifyEmailAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_VerifyEmailCheckAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_LogoutAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_LoadAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_AuthenticatedAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
      var test;
      print("object");
    });

    on<_ResetAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_ForgotPwdAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_SaveAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    on<_LoginAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });
    on<_RegisterAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
      // emit(_RegisterAuthState());

      // try {
      //   final user = await AuthProvider.signup(
      //     email: event.email,
      //     password: event.password,
      //     phonenumber: event.phonenumber,
      //     countrycode: event.countrycode,
      //     referalcode:event.referalcode
      //   );
      //   // emit(RegisterSuccessState(
      //   //   user,
      //   // ));
      // }  catch (e) {

      //   emit(_ErrorState());

      //     print(e);
      // }
    });

    on<_RefreshTokenAuthEvent>((event, emit) async {
      // TODO: implement event handler
      //emit();
    });

    // on<_UpdateTradingPasswordAuthEvent>((event, emit) async {
    //     // TODO: implement event handler
    //      await UserRepository.updateTradingPasswordRepo(
    //       user: event.user,
    //     );
    //     //emit();
    //   });
  }
}
