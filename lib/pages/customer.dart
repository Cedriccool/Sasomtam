import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:sasomtam/widgets/globals.dart' as globals;

void main() => runApp(Customer());

class Customer extends StatefulWidget {
  @override
  CustomerState createState() => new CustomerState();
}

class CustomerState extends State<Customer> {
  List locations;
  final oneSec = const Duration(seconds: 9);

  Random random = new Random();

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
      locations = json.decode(response.body);
    });

    print(locations[1]["name"]);

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

  _grid() {
    return GridView.builder(
        itemCount: locations == null ? 0 : locations.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: [
              Card(
                color: Colors.white,
                elevation: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        // leading: Icon(Icons.album, size: 10),
                        title: Text(
                          locations[index]["name"],
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          random.nextInt(900).toString() +
                              ' m', //locations[index]["username"] + ', 250m',
                          style:
                              TextStyle(fontSize: 12, color: Colors.pinkAccent),
                        ),
                        onTap: () {/* react to the tile being tapped */}),
                  ],
                ),
              ),
            ],
          );
        });
  }

  _locations() {
    return new ListView.builder(
      itemCount: locations == null ? 0 : locations.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: [
            Container(height: 10),
            Card(
              color: Colors.white,
              elevation: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album, size: 50),
                    title: Text(locations[index]["name"]),
                    subtitle: Text(locations[index]["username"] + ', 250m'),
                  ),
                ],
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
            title: new Text("Sasomtam, Claim your rewards"),
            backgroundColor: Colors.blue),
        body: //_locations()

            Column(
          children: [
            Text('Nearby Shops: '),
            new Expanded(child: _grid()),
            Text('Your last rewards:'),
            new Expanded(child: _locations())
          ],
        ));
  }
}
