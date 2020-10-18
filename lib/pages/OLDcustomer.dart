import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sasomtam/widgets/settings.dart';
import 'package:get/get.dart';
import 'package:sasomtam/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() => runApp(Customer());

class Customer extends StatelessWidget {
  Settings settings = new Settings();
  final oneSec = const Duration(seconds: 5);

  void initState() {
    new Timer.periodic(oneSec, (Timer t) {
      print('hi 2!');
      setState() {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Customer'),
      ),
      body: Center(
        child:
            JSONListView(), /*Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(height: 20),
                Text(
                  'Welcome back Cedric',
                  textAlign: TextAlign.left,
                ),
                Container(height: 10),
                Text(
                  'Closest rewarding shops:',
                  textAlign: TextAlign.left,
                ),
                Container(height: 30),
                
              ],
            )),*/
      ),
    );
  }
}

class GetUsers {
  int id;
  String name;
  String email;
  String phoneNumber;

  GetUsers({this.id, this.name, this.email, this.phoneNumber});

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone']);
  }
}

class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {
  final String apiURL = 'http://167.114.254.81/users.json';

  final oneSec = const Duration(seconds: 5);

  void initState() {
    super.initState();
    /*new Timer.periodic(oneSec, (Timer t) {
      print('hi 2!');
      fetchJSONData();
    });*/
  }

  Future<List<GetUsers>> fetchJSONData() async {
    var jsonResponse = await http.get(apiURL);

    if (jsonResponse.statusCode == 200) {
      final jsonItems =
          json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

      List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();

      return usersList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetUsers>>(
      future: fetchJSONData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView(
          children: snapshot.data
              .map(
                (user) => ListTile(
                  title: Text(user.name),
                  onTap: () {
                    print(user.name);
                  },
                  subtitle: Text(user.phoneNumber),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(user.name[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
