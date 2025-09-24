part of 'coin_bloc.dart';

@freezed
class CoinEvent with _$CoinEvent {
   const factory CoinEvent.fetchcoinlist() = _FetchCoinListEvent;
  const factory CoinEvent.fetchcoinbyid() = _FetchCoinByIdEvent;
  const factory CoinEvent.addcoin() = _AddCoinEvent;
  const factory CoinEvent.updatecoin() = _UpdateCoinEvent;
  const factory CoinEvent.deleteacoin() = _DeleteCoinEvent;

}