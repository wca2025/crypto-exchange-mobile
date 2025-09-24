import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/transaction.dart';
import '../../../data/repositories/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';
part 'transaction_bloc.freezed.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionState.initial()) {


      on<_ConvertTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });


      on<_MintTokenTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

      on<_SetupSalesTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

      on<_SetupAuctionTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
    

    on<_AcceptBidTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

  // on<_AcceptOfferEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });

  //     on<_DeclineOfferEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });

      on<_DeclineBidTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });



   on<_CoinWithdrawnTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<_CancelTransferTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

  on<_CoinTransferTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

      on<_CryptoPaymentTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

      on<_StartCardPaymentTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });


  //  on<_startCardOfferTransactionEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });

  on<_StartCardOfferTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

      on<_NftTransferTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

      on<_StartCryptoBidTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
   on<_OnmetaTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

  // on<_OnmetaCreateOnrampOrderTransactionEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });

      on<_OnmetaRefreshAccessTokenTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

      on<_OnmetagetCurrenciesTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });



    on<_OnmetagetTokensTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

  on<_OnmetagetOrderHistoryTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

    //   on<_OnmetaCreateOfframprampOrderTransactionEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

      on<_OnmetagetQuatationByFiatAmtTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<_StartCardBidTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

  // on<_OnmetaAcceptOnrampOrderTransactionEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });

 on<_FetchLiveNfts>((event, emit) async {
    // final nfts = await TransactionRepository.FetchLiveNfts();
      // emit(_DisplayNftsState(nft: nfts));
    });



 on<_FetchLiveUpcomimgAuctions>((event, emit) async {
    // final  liveupcomimgauctionsnfts = await TransactionRepository.FetchLiveUpcomimgAuctions();
      // emit(_DisplayNftsState(liveupcomimgauctionsnft: liveupcomimgauctionsnfts));
    });


 on<_FetchLiveUpcomingDrops>((event, emit) async {
  // final    fetchliveupcomingdropsnfts = await TransactionRepository.FetchLiveUpcomingDrops();
      // emit(_DisplayNftsState(fetchliveupcomingdropsnft: fetchliveupcomingdropsnfts));
    });


 on<_FetchTopCollectors>((event, emit) async {
  //  final   fetchtopcollectorsnfts = await TransactionRepository.FetchTopCollectors();
      // emit(_DisplayNftsState(topcollectorsnft: topcollectorsnfts));
    });



 on<_FetchFeaturedCreations>((event, emit) async {
  //  final   featuredcreationsnfts = await TransactionRepository.FetchFeaturedCreations();
      // emit(_DisplayNftsState(featuredcreationsnft: featuredcreationsnfts));
    });

     on<_FetchFeaturedCreators>((event, emit) async {
  //  final   featuredcreatorsnfts = await TransactionRepository.FetchFeaturedCreators();
      // emit(_DisplayNftsState(featuredcreatorsnft: featuredcreatorsnfts));
    });


 on<_FetchRecentSales>((event, emit) async {
    // final  recentsalesnfts = await TransactionRepository.FetchRecentSales();
      // emit(_DisplayNftsState(recentsalesnft: recentsalesnfts));
    });



 on<_FetchRecentCreations>((event, emit) async {
    // final  List<Transaction> recentcreationsnfts = await TransactionRepository.FetchRecentCreations();
      // emit(_DisplayNftsState(recentcreationsnft: recentcreationsnfts));
    });



  }
}
