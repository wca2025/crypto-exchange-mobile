import '../../data/models/account.dart';
import '../../data/models/addresss.dart';
import '../../data/models/asset.dart';
import '../../data/models/coin.dart';
import '../../data/models/network.dart';
import '../../data/models/order.dart';
import '../../data/models/p2p.dart';
import '../../data/models/transaction.dart';
import '../models/addresss.dart';

// List<Transaction> nftsdata = [
//   const Transaction(
//     id: 1,
//     label: '',
//     txid: '',
//     typeoff: '',
//     sender: '',
//     destination: '',
//     listPrice: 1,
//     offer: 1,
//     reservePrice: 1,
//     startPrice: 1,
//     startDate: 1,
//     endDate: 1,
//     reserveBid: 1,
//     scheduledBid: 1,
//     timeRemainingA: 1,
//     timeRemainingB: 1,
//     noOfTimesItemSold: 1,
//     royalty: 1,
//     amount: 1,
//     newAmount: 1,
//     comission: 1,
//     seller: '',
//     creator: '',
//     buyer: '',
//     sellerIncome: 1,
//     networkFee: 1,
//     lastSaleTime: 1,
//     createdAt: 1,
//     updatedAt: 1,
//     // transactionStatusId: '',
//   ),
// ];

List<Coin> coinsdata = [
  const Coin(
    id: 1,
    symbol: 'ETH',
    name: 'ETH',
    image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
    current_price: 1,
    market_cap: 1,
    market_cap_rank: 1,
    fully_diluted_valuation: 1,
    total_volume: 1,
    high_24h: 1,
    low_24h: 1,
    price_change_24h: 1,
    price_change_percentage_24h: 1,
    market_cap_change_24h: 1,
    market_cap_change_percentage_24h: 1,
    circulating_supply: '',
    total_supply: 1,
    max_supply: 1,
    ath: 1,
    ath_change_percentage: 1,
    ath_date: '',
    atl: 1,
    atl_change_percentage: 1,
    tl_date: '',
    roi: 1,
    last_updated: '',
  ),
  const Coin(
    id: 2,
    symbol: 'EOS',
    name: 'EOS',
    image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
    current_price: 1,
    market_cap: 1,
    market_cap_rank: 1,
    fully_diluted_valuation: 1,
    total_volume: 1,
    high_24h: 1,
    low_24h: 1,
    price_change_24h: 1,
    price_change_percentage_24h: 1,
    market_cap_change_24h: 1,
    market_cap_change_percentage_24h: 1,
    circulating_supply: '',
    total_supply: 1,
    max_supply: 1,
    ath: 1,
    ath_change_percentage: 1,
    ath_date: '',
    atl: 1,
    atl_change_percentage: 1,
    tl_date: '',
    roi: 1,
    last_updated: '',
  ),
  const Coin(
    id: 2,
    symbol: 'SHIB',
    name: 'SHIB',
    image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
    current_price: 1,
    market_cap: 1,
    market_cap_rank: 1,
    fully_diluted_valuation: 1,
    total_volume: 1,
    high_24h: 1,
    low_24h: 1,
    price_change_24h: 1,
    price_change_percentage_24h: 1,
    market_cap_change_24h: 1,
    market_cap_change_percentage_24h: 1,
    circulating_supply: '',
    total_supply: 1,
    max_supply: 1,
    ath: 1,
    ath_change_percentage: 1,
    ath_date: '',
    atl: 1,
    atl_change_percentage: 1,
    tl_date: '',
    roi: 1,
    last_updated: '',
  ),
  const Coin(
    id: 3,
    symbol: 'BTC',
    name: 'BTC',
    image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
    current_price: 1,
    market_cap: 1,
    market_cap_rank: 1,
    fully_diluted_valuation: 1,
    total_volume: 1,
    high_24h: 1,
    low_24h: 1,
    price_change_24h: 1,
    price_change_percentage_24h: 1,
    market_cap_change_24h: 1,
    market_cap_change_percentage_24h: 1,
    circulating_supply: '',
    total_supply: 1,
    max_supply: 1,
    ath: 1,
    ath_change_percentage: 1,
    ath_date: '',
    atl: 1,
    atl_change_percentage: 1,
    tl_date: '',
    roi: 1,
    last_updated: '',
  ),
];

// List<Account> accountsdata = [
//   // Account(
//   //   id: 1,
//   //   userID: 1,
//   //   walletid: 1,
//   //   assetID: 1,
//   //   accountname: '',
//   //   total: 1,
//   //   available: 1,
//   //   inorder: 1,
//   //   btcvalue: 1,
//   //   createdAt: 20220912,
//   //   updatedAt: 20220912,
//   // ),
// ];

// List<Asset> fiatsdata = [
//   // Asset(
//   //   id: 1,
//   //   accountID: 1,
//   //   tokenId: 1,
//   //   addressID: 1,
//   //   name: 'ergr',
//   //   image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
//   //   typeoff: 'rvr',
//   //   nftContract: 'srvsr',
//   //   initialSupply: 1,
//   //   tokenURI: 'refe',
//   //   createdAt: 20220912,
//   //   updatedAt: 20220912,
//   // ),
// ];

// List<Asset> cryptosdata = [
//   Asset(
//     id: 1,
//     accountID: 1,
//     tokenId: 1,
//     addressID: 1,
//     image: '',
//     symbol: '',
//     name: 'ergr',
//     typeoff: 'rvr',
//     nftContract: 'srvsr',
//     initialSupply: 1,
//     tokenURI: 'refe',
//     createdAt: 20220912,
//     updatedAt: 20220912,
//   ),
// ];

List<Addresss> addressesdata = [
  //  const Addresss(
  //          id:1,
  //   addresssname:'',
  //     label:'',
  //      asset:'',
  //     note:'',
  //     whitelist:false,
  //      addresss:'',
  //     createdAt:0.0,
  //    updatedAt:0.0, assetID: null, NetworkID: null,
  // ),
];

// List<P2P> p2pdata = [
//   // P2P(
//   //     id:1,
//   // ),
// ];

// List<Network> networkdata = [
//   // Network(
//   //     id:1,
//   // ),
// ];

// List<Order> orderdata = [
//   // Order(
//   //     id:1,
//   // ),
// ];

// List<Asset> nftsdata = [
//   // Order(
//   //     id:1,
//   // ),
// ];
