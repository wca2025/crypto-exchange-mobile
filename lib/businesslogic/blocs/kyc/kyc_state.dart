part of 'kyc_bloc.dart';

@freezed
class KycState with _$KycState {
  const factory KycState.initial() = _InitialState;
    const factory KycState.loading() = _LoadingKycState;
  const factory KycState.error() = _ErrorKycState;
  const factory KycState.success() = _SuccessKycState;


}
