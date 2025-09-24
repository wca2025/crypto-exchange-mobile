import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'p2p_event.dart';
part 'p2p_state.dart';
part 'p2p_bloc.freezed.dart';

class P2pBloc extends Bloc<P2pEvent, P2pState> {
  P2pBloc() : super(_Initial()) {
    on<P2pEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
