part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _InitialAccountState;
    const factory AccountState.loading() = _LoadingAccountState;
  const factory AccountState.error() = _ErrorAccountState;
  const factory AccountState.success() = _SuccessAccountState;
const factory  AccountState.displayaccounts()=_DisplayAccount;
const factory  AccountState.displayspecificaccounts()=_DisplaySpecificAccounts;

}

