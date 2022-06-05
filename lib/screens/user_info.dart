import 'dart:developer';

import 'package:assignment4_dio/models/login_request.dart';
import 'package:flutter/material.dart';
import 'package:assignment4_dio/handlers/api_client.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfo();
}

class _UserInfo extends State<UserInfo> {

  final ApiClient _client = ApiClient();
  String email = "";
  String password = "";
  String? token = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Example"),
      ),
      body: Center(
        child: Column(
            children:  [
               Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (text) {
                      email = text;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                  ),
                ),
              ),

               Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (text) {
                      password = text;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  )
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed: () {
                  _login(email, password);
                }, child: Text("Login")),
              ),

              Text(token != null ? "Token is ${token}" : "")
            ]
        ),
      ),
    );
  }


  Future<void> _login(String email, String password) async {
    var apiClient = ApiClient();
    var data = await apiClient.login(LoginRequest(email: email, password: password));
    if(data != null) {
      token = data.token;
    }else {
      token = null;
    }
    setState(() {});
  }
}