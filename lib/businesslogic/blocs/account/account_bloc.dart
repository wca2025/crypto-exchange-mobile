import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/account.dart';
import '../../../data/repositories/account_repository.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountState.initial()) {
 on<_FetchAccountListEvent>((event, emit) async {
      //  account = await  AccountRepository.getAllAccounts();
      // emit(DisplayAccounts( account:  accounts));
    });

    on<_FetchAccountByIdEvent>((event, emit) async {
      //  Account  account = await  AccountRepository.getAccount(id: event.id);
      // emit(DisplaySpecificAccount( account:  account));
    });
 on<_AddAccountEvent>((event, emit) {
      // TODO: implement event handler
    });

 on<_UpdateAccountEvent>((event, emit) {
      // TODO: implement event handler
    });

   }
}
