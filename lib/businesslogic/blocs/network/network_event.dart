part of 'network_bloc.dart';

@freezed
class NetworkEvent with _$NetworkEvent {
   const factory NetworkEvent.fetchnetworklist() = _FetchNetworkListEvent;
  const factory NetworkEvent.fetchnetworkbyid() = _FetchNetworkByIdEvent;
  const factory NetworkEvent.addnetwork() = _AddNetworkEvent;
  const factory NetworkEvent.updatenetwork() = _UpdateNetworkEvent;
  const factory NetworkEvent.deletenetwork() = _DeleteNetworkEvent;

}