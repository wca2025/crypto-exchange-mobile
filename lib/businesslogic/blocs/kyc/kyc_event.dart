part of 'kyc_bloc.dart';

@freezed
class KycEvent with _$KycEvent {
   const factory KycEvent.fetchkyclist() = _FetchKycListEvent;
  const factory KycEvent.fetchkycbyid() = _FetcKycByIdEvent;
  const factory KycEvent.addkyc() = _AddKycEvent;
  const factory KycEvent.updatekyc() = _UpdateKycEvent;
  const factory KycEvent.deletekyc() = _DeleteKycEvent;

}