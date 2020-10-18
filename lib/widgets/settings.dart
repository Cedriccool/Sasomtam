import 'package:shared_preferences/shared_preferences.dart';
import 'package:sasomtam/widgets/globals.dart' as globals;

class Settings {
  static const String _kPrefKey = 'consumables';
  static Future<void> _writes = Future.value();

  Future<String> loadSettings() async {
    var result = "ok";

    await getString("type").then((value) {
      globals.type = value;
      if(globals.type == '' )
        globals.type = 'undefined';
      print("globals.type: " + globals.type.toString());
    });

     await getString("email").then((value) {
      globals.email = value;
      print("globals.email: " + globals.email.toString());
    });

    await getInt("rewardCounters").then((value) {
      globals.rewardCounters = value;
      print("globals.rewardCounters: " + globals.rewardCounters.toString());
    });

    await getBool("showIG").then((value) {
      globals.showIG = value;
    });


    return result;
  }

  Future<String> saveInt(String _key, int _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_key, _value);
    return 'ok';
  }

  Future<int> getInt(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _result = prefs.getInt(_key) ?? 0;
    return _result;
  }

  Future<String> getString(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _result = prefs.getString(_key) ?? '';
    return _result;
  }

  Future<String> saveString(String _key, String _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, _value);
    return "ok";
  }

  Future<bool> getBool(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _result = prefs.getBool(_key) ?? false;
    return _result;
  }

  Future<String> saveBool(String _key, bool _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_key, _value);
    return "ok";
  }

/*
  Future<int> getInt(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _result = prefs.getInt(_key) ?? 0;
    return _result;
  }
*/

  static Future<void> save(String id) {
    _writes = _writes.then((void _) => _doSave(id));
    return _writes;
  }

  static Future<void> consume(String id) {
    _writes = _writes.then((void _) => _doConsume(id));
    return _writes;
  }

  static Future<List<String>> load() async {
    return (await SharedPreferences.getInstance()).getStringList(_kPrefKey) ??
        [];
  }

  static Future<void> _doSave(String id) async {
    List<String> cached = await load();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cached.add(id);
    await prefs.setStringList(_kPrefKey, cached);
  }

  static Future<void> _doConsume(String id) async {
    List<String> cached = await load();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cached.remove(id);
    await prefs.setStringList(_kPrefKey, cached);
  }
}
