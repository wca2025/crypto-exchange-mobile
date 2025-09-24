import 'package:get/get.dart';

import '../../l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
// import 'copyright.dart';
// import 'downloads.dart';
// import 'license.dart';
// import 'license_agreement.dart';
// import 'privacy.dart';
// import 'privacy_policy.dart';
import '../widgets/responsive.dart';
// import 'supported.dart';
// import 'terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        body: Responsive(
          mobile: _LanguageMobile(
            passedColor: Colors.pink,
            passedColorName: 'Pink',
            key: null,
          ),
          tablet: _LanguageTablet(
            passedColor: Colors.pink,
            passedColorName: 'Pink',
            key: null,
          ),
        ),
      ),
    );
  }
}

class _LanguageTablet extends StatefulWidget {
  final Color passedColor;
  final String passedColorName;

  @override
  __LanguageTabletState createState() => __LanguageTabletState();

  const _LanguageTablet(
      {Key? key, required this.passedColor, required this.passedColorName})
      : super(key: key);
}

class __LanguageTabletState extends State<_LanguageTablet> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      resizeToAvoidBottomInset: false, //new line
      backgroundColor: theme.backgroundColor,

      appBar: AppBar(
        elevation: 0.5,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          // LanguagePickerWidget(),
          const SizedBox(width: 2),
        ],
      ),
      body: Container(
          color: theme.backgroundColor,
          child: Column(
            children: <Widget>[
              LanguageWigdet(),
              Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.06,
                  // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: ListTile(
                      title: InkWell(
                        onTap: () {
                          // Navigator.of(context,rootNavigator: true)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return AddressList();
                          // }));
                        },
                        child: Text('AppLocalizations.of(context).language',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                      subtitle:
                          Text('AppLocalizations.of(context).helloWorld'))),
            ],
          )),
    );
  }
}

class _LanguageMobile extends StatefulWidget {
  final Color passedColor;
  final String passedColorName;

  const _LanguageMobile(
      {Key? key, required this.passedColor, required this.passedColorName})
      : super(key: key);
  @override
  _LanguageMobileState createState() => _LanguageMobileState(
      passedColor: this.passedColor, passedColorName: this.passedColorName);
}

class _LanguageMobileState extends State<_LanguageMobile> {
  Color passedColor;
  String passedColorName;
  _LanguageMobileState(
      {required this.passedColor, required this.passedColorName});

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      resizeToAvoidBottomInset: false, //new line
      backgroundColor: theme.backgroundColor,

      appBar: AppBar(
        elevation: 0.5,
        bottomOpacity: 1.0,
        title: Text("Language", style: TextStyle(color: Colors.black)),
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          // LanguagePickerWidget(),
          const SizedBox(width: 2),
        ],
      ),
      body: Container(
          color: theme.backgroundColor,
          child:  Column(
               children:[
                  
                  Text("hello".tr),
                  Text("going".tr),
                  Text("email".trParams({
                      'name':'John',
                      'email':'johnabc@gmail.com'
                  })),

  Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                           var locale = Locale('ru', 'RU');
                          Get.updateLocale(locale);
                        },
                        child: Text("Russian",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      
                    )),


                      Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                            var locale = Locale('es', 'ES');
                          Get.updateLocale(locale);
                        },
                        child: Text("Spanish",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      
                    )),


                      Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          var locale = Locale('en', 'US');
                          Get.updateLocale(locale);
                        },
                        child: Text("English",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      
                    )),
                   
                         
                

                  
               ]
             )),
    );
  }
}

class LanguageWigdet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);
    return Center(
        child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 72,
            child: Text(
              flag,
              style: TextStyle(fontSize: 80),
            )));
  }
}

class LocaleProvider extends ChangeNotifier {
  late Locale _locale;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = '' as Locale;
    notifyListeners();
  }
}

// class LanguagePickerWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LocaleProvider>(context);
//     final locale = provider.locale;

//     return DropdownButtonHideUnderline(
//       child: ListView(
//         // value: locale,
//         // icon: Container(width: 12),
//         items: L10n.all.map(
//           (locale) {
//             final flag = L10n.getFlag(locale.languageCode);

//             return InkWell(
//               child: Center(
//                 child: Text(
//                   flag,
//                   style: TextStyle(fontSize: 32),
//                 ),
//               ),
            
//               onTap: () {
//                 final provider =
//                     Provider.of<LocaleProvider>(context, listen: false);

//                 provider.setLocale(locale);
//               },
//             );
//           },
//         ).toList(),
//         onChanged: (_) {},
//       ),
//     );
//   }
// }
