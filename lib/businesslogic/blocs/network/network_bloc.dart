import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/network.dart';
import '../../../data/repositories/network_repository.dart';

part 'network_event.dart';
part 'network_state.dart';
part 'network_bloc.freezed.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
   NetworkBloc() : super(NetworkState.initial()) {
   List<Network> network = [];

    on<_FetchNetworkListEvent>((event, emit) async {
      // networks = await NetworkRepository.readAllNetworks();
      // emit(_DisplayNetworks(network: networks));
    });

    on<_FetchNetworkByIdEvent>((event, emit) async {
      // Network network = await NetworkRepository.readNetwork(id: event.id);
      // emit(_DisplaySpecificNetwork(network: network));
    });

} 
}
