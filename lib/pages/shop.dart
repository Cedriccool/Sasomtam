import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:sasomtam/widgets/globals.dart' as globals;

void main() => runApp(Shop());

class Shop extends StatefulWidget {
  @override
  ShopState createState() => new ShopState();
}

class ShopState extends State<Shop> {
  List users;
  final oneSec = const Duration(seconds: 9);

  Future<String> getData() async {
    String url = 'http://167.114.254.81/users.json';
    url = url +
        '?lat=' +
        globals.lat.toString() +
        '&lng=' +
        globals.lng.toString();

    print(url);

    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    this.setState(() {
      users = json.decode(response.body);
    });

    print(users[1]["name"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
    new Timer.periodic(oneSec, (Timer t) {
      print('hi 2!');
      this.getData();
    });
  }

  _users() {
    return new ListView.builder(
      itemCount: users == null ? 0 : users.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: [
            Container(height: 10),
            InkWell(
              onTap: () {
                print("Card Clicked: " + users[index]["id"].toString());
                globals.currentUser = users[index];
                print(globals.currentUser);
              },
              child: new Card(
                color: Colors.white,
                elevation: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.album, size: 50),
                      title: Text(users[index]["name"]),
                      subtitle: Text(users[index]["username"] + ', 250m'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Shop Owner"), backgroundColor: Colors.pink),
        body: //_users()
            Column(
          children: [
            Text('Please select the customer: '),
            new Expanded(child: _users()),
            Text('Your last rewards:'),
            new Expanded(child: _users())
          ],
        ));
  }
}
