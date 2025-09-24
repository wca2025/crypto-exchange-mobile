import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';
part 'kyc_bloc.freezed.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  KycBloc() : super(KycState.initial()) {
    on<KycEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
