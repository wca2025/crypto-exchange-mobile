import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/coin.dart';
import '../../../data/repositories/coin.dart';

part 'coin_event.dart';
part 'coin_state.dart';
part 'coin_bloc.freezed.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinState.initial()) {
 on<_FetchCoinListEvent>((event, emit) async {
    // final  coins = await CoinRepository.readAllCoins();
    //   emit(_DisplayCoinState(coin: coins));
    });

    

    on<_FetchCoinByIdEvent>((event, emit) async {
      // Coin coin = await CoinRepository.readCoin(id: event.id);
      // emit(DisplaySpecificCoin(coin: coin));
    });
  }
}
