part of 'addresss_bloc.dart';

@freezed
class AddresssState with _$AddresssState {
  const factory AddresssState.initial() = _InitialAddresssState;
    const factory AddresssState.loading() = _LoadingAddresssState;
  const factory AddresssState.error() = _ErrorAddresssState;
  const factory AddresssState.success() = _SuccessAddresssState;
const factory  AddresssState.displayaddressss()=_DisplayAddresss;
const factory  AddresssState.displayspecificaddressss()=_DisplaySpecificAddresss;

}
