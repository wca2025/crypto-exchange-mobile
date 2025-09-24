part of 'coin_bloc.dart';

@freezed
class CoinState with _$CoinState {

    const factory CoinState.initial() = _InitialCoinState;
    const factory CoinState.loading() = _LoadingCoinState;
  const factory CoinState.error() = _ErrorCoinState;
  const factory CoinState.success() = _SuccesCoinState;
// const factory CoinState.displaycoins(final List<Coin> coin)=_DisplayCoinState;
const factory CoinState.displayspecificcoins()=_DisplaySpecificCoinsState;


}

