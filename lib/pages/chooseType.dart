import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sasomtam/widgets/settings.dart';
import 'package:get/get.dart';
import 'package:sasomtam/main.dart';

void main() => runApp(ChooseType());

class ChooseType extends StatelessWidget {
  Settings settings = new Settings();

  String _markdownData = """
# Like Me Counter, About

Thank you for downloading our app.
With Like Me Counter, you can show in your shop or in your room all your Social Data.



We are compatible for now with: 
+ Facebook Pages Likes
+ Instagram Business Followers

  

This app is new, and is displaying **Videos Ads when you start the counter**, and every **45 minutes.**
We will soon propose a paid version to get rid of all advertising, thank you for your comprehension.



If you want to contact us, please use this email: **shanuy.iot@gmail.com**
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sasomtam'),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(height: 20),
                Text(
                    'Please let us know if you are a customer, looking for the best rewards, or a shop owner.'),
                Container(height: 30),
                SizedBox(
                  height: 40,
                  width: double.infinity, // match_parent
                  child: FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.black,
                    onPressed: () {
                      settings.saveString('type', 'customer');
                      Get.off(HomePage());
                    },
                    child: Text(
                      " I'm a customer ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(height: 30),
                SizedBox(
                  height: 40,
                  width: double.infinity, // match_parent
                  child: FlatButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.black,
                    onPressed: () {
                      settings.saveString('type', 'shop');
                      Get.off(HomePage());
                    },
                    child: Text(
                      " I'm a shop owner ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
