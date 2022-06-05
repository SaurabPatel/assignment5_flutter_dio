import 'package:assignment4_dio/models/user_resp.dart';
import 'package:assignment4_dio/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:assignment4_dio/handlers/api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: "Dio Networking",
      home: UserInfo(),
    );
  }
}


