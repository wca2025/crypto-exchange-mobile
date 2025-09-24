// 9PZ9i88wKkwZEPP#

import 'package:cx/presentation/pro/Device_management.dart';
import 'package:cx/presentation/pro/alerts.dart';
import 'package:cx/presentation/pro/auto.dart';
import 'package:cx/presentation/pro/master.dart';
import 'package:cx/presentation/pro/cash_paymentmethodlist.dart';
import 'package:cx/presentation/pro/chat.dart';
import 'package:cx/presentation/pro/copytrading.dart';
import 'package:cx/presentation/pro/running.dart';

import '../../data/models/setting.dart';
import '../../presentation/pro/antiphishing.dart';
import '../../presentation/pro/borrow.dart';
import '../../presentation/pro/countrycode.dart';
import '../../presentation/pro/nickname.dart';
import '../../presentation/pro/p2pbuy.dart';
import '../../presentation/pro/p2pmerchant.dart';
import '../../presentation/pro/repay.dart';
import '../../presentation/pro/twofa.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/localization/intl/messages_ko.dart';
import '../pro/nft_details_page.dart';
import '2facode.dart';
import 'announcements.dart';
import 'congratsmaster.dart';
import 'contactus.dart';
import 'emailverification3.dart';
import 'language.dart';
import 'leveragedtoken.dart';
import 'qrcode.dart';
import 'referals.dart';
import 'resetpassword2.dart';
import 'rewardcenter.dart';
import 'selectaccounts.dart';
import 'selectaccountsdeposit.dart';
import 'selectaccountswithdraw.dart';
import 'selecttoken.dart';
import 'splash_screen.dart';
import 'submitrequest.dart';
import 'support.dart';
import 'tradingbotlistdetail.dart';
import 'tradingbotoptionlist.dart';

import 'accountprofile.dart';
import 'help.dart';
import 'modals.dart';
import 'notifications.dart';
import 'phoneverification.dart';
import 'security.dart';
import 'selectorders.dart';
import 'usercenter.dart';

import 'add_address.dart';
import 'address_list.dart';
import 'convert.dart';
import 'delete_account.dart';
import 'disable_account.dart';
import 'collection.dart';
import 'editad.dart';
import 'editaddress.dart';
import 'editpaymentmethod.dart';
import 'emailverification2.dart';
import 'market.dart';
import 'myads.dart';
import 'others.dart';
import 'p2pappeal.dart';
import 'add_payment_method.dart';
import 'paymentmethodlist.dart';
import 'postad.dart';
import 'profile.dart';
import 'trade.dart';
import 'verificationbusiness.dart';
import 'verificationpersonal.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'buy.dart';
import 'change_password.dart';
import 'chart.dart';
import 'emailverification.dart';
import 'p2pordercompleted.dart';
import 'deposit.dart';
import 'resetpassword1.dart';
import 'homepage.dart';
import 'home_view.dart';
import 'homepage.dart';
import 'market.dart';
import 'messages.dart';
import 'orders.dart';
import 'p2psell.dart';
import 'confirmorder.dart';
import 'p2ppendingpayment.dart';
import 'p2prelease.dart';
import 'settings.dart';
import 'sign_in.dart';
import 'tokendetail.dart';
import 'orderdetails.dart';
import 'trade.dart';
import 'trading_password.dart';
import 'transfer.dart';
import 'withdraw.dart';
import 'package:universal_platform/universal_platform.dart';
import '../../main.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

import '../Widgets/responsive.dart';
import 'gains.dart';
import 'account.dart';
import 'sign_up.dart';
import 'sign_in.dart';

class ShowAppMaterial extends StatefulWidget {
  @override
  _ShowAppMaterialState createState() => _ShowAppMaterialState();
}

class _ShowAppMaterialState extends State<ShowAppMaterial> {
  int _selectedIndex = 0;

  late PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // ignore: prefer_final_fields
  List<Widget> _buildScreens = <Widget>[
    // Homepage(),
    // Market(),
    Trade(),
    // Gain(),
    CongratsMaster(),
    Account(),
// VerificationPersonal(),
// VerificationBusiness(),

//     Alert(),
//     Announcments(),
//     Twofa(),

    // Withdraw(),
    // Twofacode(),
    // SignIn(),
    // SignUp(),
    // SplashScreen(),
    // Tradingpassword(),
    // EmailPhoneVerification2(),
    // EmailPhoneVerification(),
    // EmailPhoneVerification3(),
    // PhoneVerification(),
    // P2psell(),
    // P2pbuy(),

    // P2pMerchant(),
    // Nickname(),
    // About(),
    // AccProfile(),
    // Borrow(),
    // Repay(),
    // CashPaymentMethodList(),
    // Convert(),
    // deleteAccount(),
    // Deposit(),
    //  Devicemanagement(),
    //  disableAccount(),
    // Transfer(),
    // CountryCode(),
    // P2pAppeal(),
    // P2pPending(),
    // tokenDetail(),

    // P2pRelease(), P2pOrderCompleted(),
    // ConfirmOrder(),
    // OrderDetails(),
// Contactus(),
// PostAd(),
    Auto(),
// tokenDetail(),

    // PaymentMethodList(),
//     SearchListRepay(),
//     SearchListBorrow(),
//     SearchListPaymentMeth(),
//     SearchList(),
//     SearchListConvert(),
//     SearchListAppeal(),
//     SearchListBuy(),
//     SearchListAdvert(),
//     SearchOrders(),
//     SearchAccountsWithdraws(),
//     SearchAccountsDeposits(),
//     SearchAccounts(),
//     Security(),
//     RewardCenter(),
//     Referals(),
//     Qrcode(),
//     ResetPassword(),
//     ResetPassword2(),
//     P2pMerchant(),
//     Earndetail(),
//     Language(),
    // AddAddress(),
    // EditAddress(),

    // Notifications(),

    // Security(),

    // CountryCode(),
    // Antiphishing(),

    // Others(),

// Help(),
    // MyAds(),

    // Changepassword(),

// Chart(),
    // Chat(),

    // HomeScreen(),
    // Usercenter(),

    // MyAds(),
//

    // LeveragedTokem(),

    // SubmitRequest(),

    // Copytrading(),
// BecomeMaster()
    Running()
    // Order(),

    // SearchListAddress(),
//      PostAd(),
//         EditAd(),
//    PaymentMethod(),
//  EditPaymentMethod(),

// Tradingbotlistdetail4(),

// Tradingbotlistdetail3(),
// Tradingbotlistdetail2(),
// Tradingbotlistdetail1(),
//  P2P(),
    // Buy(),
    // Modals(),

    // NftDetailsPage(),

    // Collection(),
    // Profile(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart),
        title: ("Markets"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.money),
        title: ("Trade"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart),
        title: ("Earns"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.money),
        title: ("Account"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );

    // return Scaffold(
    //   backgroundColor: theme.backgroundColor,
    //   appBar: null,
    //   body: Center(
    //     child: _buildScreens.elementAt(_selectedIndex),
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     backgroundColor: Colors.white,
    //     type: BottomNavigationBarType.fixed, // This is all you need!

    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.bar_chart),
    //         label: 'Markets',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.money),
    //         label: 'Trade',
    //       ),
    //        BottomNavigationBarItem(
    //         icon: Icon(Icons.photo),
    //         label: 'Nfts',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.wallet),
    //         label: 'Acccounts',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: '23rsd',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: '23rsd',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'notf',
    //       ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: Colors.black,
    //     onTap: _onItemTapped,
    //   ),
    // );
  }
}

class ShowAppCupertino extends StatefulWidget {
  @override
  _ShowAppCupertinoState createState() => _ShowAppCupertinoState();
}

class _ShowAppCupertinoState extends State<ShowAppCupertino> {
  int _selectedIndex = 0;

  late PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // ignore: prefer_final_fields
  List<Widget> _buildScreens = <Widget>[
    Homepage(),
    Market(),
    Trade(),
    Gain(),
    Account(),
// VerificationPersonal(),
// VerificationBusiness(),

//     Alert(),
//     Announcments(),
//     Twofa(),

    // Withdraw(),
    // Twofacode(),
    // SignIn(),
    // SignUp(),
    // SplashScreen(),
    // Tradingpassword(),
    // EmailPhoneVerification2(),
    // EmailPhoneVerification(),
    // EmailPhoneVerification3(),
    // PhoneVerification(),
    // P2psell(),
    // P2pbuy(),

    // P2pMerchant(),
    // Nickname(),
    // About(),
    // AccProfile(),
    // Borrow(),
    // Repay(),
    // CashPaymentMethodList(),
    // Convert(),
    // deleteAccount(),
    // Deposit(),
    //  Devicemanagement(),
    //  disableAccount(),
    // Transfer(),
    // CountryCode(),
    // P2pAppeal(),
    // P2pPending(),
    // tokenDetail(),

    // P2pRelease(), P2pOrderCompleted(),
    // ConfirmOrder(),
    // OrderDetails(),
// Contactus(),
// PostAd(),

// tokenDetail(),

    // PaymentMethodList(),
//     SearchListRepay(),
//     SearchListBorrow(),
//     SearchListPaymentMeth(),
//     SearchList(),
//     SearchListConvert(),
//     SearchListAppeal(),
//     SearchListBuy(),
//     SearchListAdvert(),
//     SearchOrders(),
//     SearchAccountsWithdraws(),
//     SearchAccountsDeposits(),
//     SearchAccounts(),
//     Security(),
//     RewardCenter(),
//     Referals(),
//     Qrcode(),
//     ResetPassword(),
//     ResetPassword2(),
//     P2pMerchant(),
//     Earndetail(),
//     Language(),
    // AddAddress(),
    // EditAddress(),

    // Notifications(),

    // Security(),

    // CountryCode(),
    // Antiphishing(),

    // Others(),

// Help(),
    // MyAds(),

    // Changepassword(),

// Chart(),
    // Chat(),

    // HomeScreen(),
    // Usercenter(),

    // MyAds(),
//

    // LeveragedTokem(),

    // SubmitRequest(),

    // CopyTradimg(),

    // Order(),

    // SearchListAddress(),
//      PostAd(),
//         EditAd(),
//    PaymentMethod(),
//  EditPaymentMethod(),

// Tradingbotlistdetail4(),

// Tradingbotlistdetail3(),
// Tradingbotlistdetail2(),
// Tradingbotlistdetail1(),
//  P2P(),
    // Buy(),
    // Modals(),

    // NftDetailsPage(),

    // Collection(),
    // Profile(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart),
        title: ("Markets"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.money),
        title: ("Trade"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart),
        title: ("Earns"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.money),
        title: ("Account"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );

    // return Scaffold(
    //   backgroundColor: theme.backgroundColor,
    //   appBar: null,
    //   body: Center(
    //     child: _buildScreens.elementAt(_selectedIndex),
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     backgroundColor: Colors.white,
    //     type: BottomNavigationBarType.fixed, // This is all you need!

    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.bar_chart),
    //         label: 'Markets',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.money),
    //         label: 'Trade',
    //       ),
    //        BottomNavigationBarItem(
    //         icon: Icon(Icons.photo),
    //         label: 'Nfts',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.wallet),
    //         label: 'Acccounts',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: '23rsd',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: '23rsd',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'notf',
    //       ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.home),
    //       //   label: 'notf',
    //       // ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: Colors.black,
    //     onTap: _onItemTapped,
    //   ),
    // );
  }
}
