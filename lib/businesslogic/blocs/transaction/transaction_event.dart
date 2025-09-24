part of 'transaction_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.fetchtransactionlist() =
      _FetchTransactionListEvent;
  const factory TransactionEvent.fetchtransactionbyid() =
      _FetchTransactionByIdEvent;
  const factory TransactionEvent.addtransaction() = _AddTransactionEvent;
  const factory TransactionEvent.updatetransaction() = _UpdateTransactionEvent;
  const factory TransactionEvent.coinassetWithdrawn() =
      _CoinWithdrawnTransactionEvent;
  const factory TransactionEvent.coinassetDeposit() =
      _CoinDepositTransactionEvent;

  const factory TransactionEvent.deletetransaction() = _DeleteTransactionEvent;
  const factory TransactionEvent.fetchconvert() = _ConvertTransactionEvent;
  const factory TransactionEvent.minttoken() = _MintTokenTransactionEvent;
  const factory TransactionEvent.setupsales() = _SetupSalesTransactionEvent;
  const factory TransactionEvent.setupauction() = _SetupAuctionTransactionEvent;
  const factory TransactionEvent.acceptbid() = _AcceptBidTransactionEvent;
  const factory TransactionEvent.acceptoffer() = _AcceptOfferTransactionEvent;
  const factory TransactionEvent.declineoffer() = _DeclineOfferTransactionEvent;
  const factory TransactionEvent.declinebid() = _DeclineBidTransactionEvent;
  const factory TransactionEvent.cancel() = _CancelTransferTransactionEvent;
  const factory TransactionEvent.cointransfer() = _CoinTransferTransactionEvent;
  const factory TransactionEvent.cryptopayment() =
      _CryptoPaymentTransactionEvent;
  const factory TransactionEvent.startcardpayment() =
      _StartCardPaymentTransactionEvent;
  const factory TransactionEvent.startcardofferpayment() =
      _StartCardOfferTransactionEvent;
  const factory TransactionEvent.nfttransfer() = _NftTransferTransactionEvent;
  const factory TransactionEvent.startcryptobid() =
      _StartCryptoBidTransactionEvent;
  const factory TransactionEvent.onmeta() = _OnmetaTransactionEvent;
  const factory TransactionEvent.onmetacreateonramporder() =
      _OnmetacreateOnrampOrderTransactionEvent;
  const factory TransactionEvent.onmetarefreshaccesstoken() =
      _OnmetaRefreshAccessTokenTransactionEvent;
  const factory TransactionEvent.onmetagetcurrencies() =
      _OnmetagetCurrenciesTransactionEvent;
  const factory TransactionEvent.onmetagetorderhistory() =
      _OnmetagetOrderHistoryTransactionEvent;
  const factory TransactionEvent.onmetagettokens() =
      _OnmetagetTokensTransactionEvent;
  const factory TransactionEvent.onmetacreateofferramp() =
      _OnmetacreateOfferampOrderTransactionEvent;
  const factory TransactionEvent.onmetagetquatationbyfiatamt() =
      _OnmetagetQuatationByFiatAmtTransactionEvent;
  const factory TransactionEvent.startcardbid() = _StartCardBidTransactionEvent;
  const factory TransactionEvent.onmetaacceptonramporder() =
      _OnmetaacceptOnrampOrderTransactionEvent;
  const factory TransactionEvent.fetchliveupcomimgauctions() =
      _FetchLiveUpcomimgAuctions;
  const factory TransactionEvent.fetchliveupcomingdrops() =
      _FetchLiveUpcomingDrops;
  const factory TransactionEvent.fetchtopcollectors() = _FetchTopCollectors;
  const factory TransactionEvent.fetchfeaturedcreations() =
      _FetchFeaturedCreations;
  const factory TransactionEvent.fetchfeaturedcreators() =
      _FetchFeaturedCreators;
  const factory TransactionEvent.fetchrecentsales() = _FetchRecentSales;
  const factory TransactionEvent.fetchrecentcreations() = _FetchRecentCreations;
  const factory TransactionEvent.fetchlivenfts() = _FetchLiveNfts;
  
}
