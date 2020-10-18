import 'package:sasomtam/widgets/settings.dart';

class Init {
  static Future initialize() async {
    /*Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
*/
    await _registerServices();
    await _loadSettings();
  }

  static _registerServices() async {
    print("starting registering services");
    await Future.delayed(Duration(seconds: 1));
    print("finished registering services");
  }

  static _loadSettings() async {
    Settings settings = new Settings();
    print("starting loading settings");
    settings.loadSettings();

    await Future.delayed(Duration(seconds: 1));
    print("finished loading settings");
  }
}
