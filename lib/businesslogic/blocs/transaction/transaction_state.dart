part of 'transaction_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _InitialState;
  const factory TransactionState.loading() = _LoadingTransactionState;
  const factory TransactionState.error() = _ErrorTransactionState;
  const factory TransactionState.success() = _SuccessTransactionState;
  const factory TransactionState.assetCreated() = _AssetCreatedState;
  const factory TransactionState.assetWithdrawn() =
      _CoinWithdrawnTransactionState;
  const factory TransactionState.assetDeposit() = _CoinDepositTransactionState;
  const factory TransactionState.assetPutOnSale() =
      _AssetPutOnSaleTransactionState;
  const factory TransactionState.assetUpdated() = _AssetUpdatedTransactionState;
  const factory TransactionState.assetDeleted() = _AssetDeletedTransactionState;
  const factory TransactionState.auctionScheduled() =
      _AuctionScheduledTransactionState;
  const factory TransactionState.auctionStarted() =
      _AuctionStartedTransactionState;
  const factory TransactionState.auctionEnded() = _AuctionEndedTransactionState;
  const factory TransactionState.auctionCanceled() =
      _AuctionCanceledTransactionState;
  const factory TransactionState.bidPlaced() = _BidPlacedTransactionState;
  const factory TransactionState.bidAccepted() = _BidAcceptedTransactionState;
  const factory TransactionState.offerWithdrawn() =
      _OfferWithdrawnTransactionState;
  const factory TransactionState.offerMade() = _OfferMdeTransactionState;
  const factory TransactionState.offerAccepted() =
      _OfferAcceptedTransactionState;
  const factory TransactionState.orderCreated() = _OrderCreatedTransactionState;
  const factory TransactionState.orderUpdated() = _OrderUpdatedTransactionState;
  const factory TransactionState.orderDeleted() = _OrderDeletedTransactionState;
  const factory TransactionState.orderFilled() = _OrderFilledTransactionState;
  const factory TransactionState.orderCanceled() =
      _OrderCancelledTransactionState;
  const factory TransactionState.orderconfirmed() =
      _OrderConfirmedTransactionState;
  const factory TransactionState.orderfailed() = _OrderFailedTransactionState;
  const factory TransactionState.transferCreated() =
      _TransferCreatedTransactionState;
  const factory TransactionState.transferUpdated() =
      _TransferUpdatedTransactionState;
  const factory TransactionState.transferDeleted() =
      _TransferDeletedTransactionState;
  const factory TransactionState.transferCanceled() =
      _TransferCanceledTransactionState;
  const factory TransactionState.p2pCreated() =
      _LoadingP2PCreatedTransactionState;
  const factory TransactionState.p2pappealed() =
      _ErrorP2PAppealedTransactionState;
  const factory TransactionState.p2pUpdated() =
      _SuccessP2PUpdatedTransactionState;
  const factory TransactionState.p2pDeleted() =
      _LoadingP2PDeletedTransactionState;
  // const factory TransactionState.displaynfts(final List<Transaction> nft) =
  //     _DisplayNftsState;
  const factory TransactionState.initialnft() = _InitialNftState;
  const factory TransactionState.groupnftbyid(final List<Transaction> nft) =
      _DisplayNftState;
}
