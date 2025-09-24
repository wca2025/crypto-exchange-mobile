part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {

   const factory AccountEvent.fetchaccountlist() = _FetchAccountListEvent;
  const factory AccountEvent.fetchaccountbyid() = _FetchAccountByIdEvent;
  const factory AccountEvent.addaccount() = _AddAccountEvent;
  const factory AccountEvent.updateaccount() = _UpdateAccountEvent;
  const factory AccountEvent.deleteaccount() = _DeleteAccountEvent;

}
