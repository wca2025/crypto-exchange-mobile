part of 'addresss_bloc.dart';

@freezed
class AddresssEvent with _$AddresssEvent {
  const factory AddresssEvent.fetchaddresslist() = _FetchAddresssListEvent;
  const factory AddresssEvent.fetchaddressbyid() = _FetchAddresssByIdEvent;
  const factory AddresssEvent.addaddress() = _AddAddresssEvent;
  const factory AddresssEvent.updateaddress() = _UpdateAddresssEvent;
  const factory AddresssEvent.deleteaddress() = _DeleteAddresssEvent;

  





}