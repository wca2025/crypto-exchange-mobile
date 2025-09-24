import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelManager {
  static Mixpanel? _instance;

  static Future<Mixpanel> init() async {
    if (_instance == null) {
      
      Mixpanel _instance =  await Mixpanel.init("54fad39ef67531ed13241c708abc985f", 
      trackAutomaticEvents: false,
        optOutTrackingDefault: true);
    }
    return _instance!;
  }
}
