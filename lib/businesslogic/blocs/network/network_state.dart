part of 'network_bloc.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.initial() = _InitialState;
    const factory NetworkState.loading() = _LoadingNetworkState;
  const factory NetworkState.error() = _ErrorNetworkState;
  const factory NetworkState.success() = _SuccessNetworkState;
const factory NetworkState.displaynetworks()=_DisplayNetwork;
const factory NetworkState.displayspecificnetworks()=_DisplaySpecificNetworks;


}
