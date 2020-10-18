import 'package:flutter/material.dart';
import 'package:sasomtam/splash_screen.dart';
import 'package:sasomtam/init.dart';
import 'package:get/get.dart';
import 'package:sasomtam/widgets/globals.dart' as globals;
import 'package:sasomtam/pages/chooseType.dart';
import 'package:sasomtam/pages/customer.dart';
import 'package:sasomtam/pages/shop.dart';
import 'package:sasomtam/pages/login.dart';
//import 'package:file_chooser/file_chooser.dart';
//import 'package:window_size/window_size.dart' as window_size;
import 'dart:math' as math;

void main() {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  window_size.getWindowInfo().then((window) {
    if (window.screen != null) {
      final screenFrame = window.screen.visibleFrame;
      final width = math.max((screenFrame.width / 6).roundToDouble(), 280.0);
      final height = screenFrame.height
          .roundToDouble(); //.max((screenFrame.height / 2).roundToDouble(), 600.0);
      final left = ((screenFrame.width - width + 50)).roundToDouble();
      final top = 0.0; //((screenFrame.height - height) / 3).roundToDouble();
      final frame = Rect.fromLTWH(left, top, width, height);
      window_size.setWindowFrame(frame);
      window_size.setWindowMinSize(Size(0.8 * width, 0.8 * height));
      window_size.setWindowMaxSize(Size(1.5 * width, 1.5 * height));
      window_size.setWindowTitle('Sasomtam');
    } else {
      print('no null...');
    }
  });
*/
  runApp(new InitializationApp());
}

class InitializationApp extends StatelessWidget {
  final Future _initFuture = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Initialization',
      home: FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print('done');
            print(globals.type);

            return Login();

            globals.type = 'shop'; // TEMP

            if (globals.type == 'undefined') {
              return ChooseType();
            } else if (globals.type == 'customer') {
              return Customer();
            } else if (globals.type == 'shop') {
              return Shop();
            }

            return ChooseType();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Initialization"),
      ),
    );
  }
}
