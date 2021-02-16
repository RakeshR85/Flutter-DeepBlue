import 'dart:ui';
import './admin_list.dart';
//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class AdminAuthentication extends StatefulWidget {
  @override
  _AdminAuthenticationState createState() => _AdminAuthenticationState();
}

class _AdminAuthenticationState extends State<AdminAuthentication> {
  var authenticationData = {
    'email': 'admin@gmail.com',
    'password': '#xyzHospital'
  };
  var verify = {'email': 'email', 'password': 'password'};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login as Admin"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.all(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 8.0,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50, left: 40, right: 40),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(labelText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                    onSaved: (value) {
                      verify['email'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50, left: 40, right: 40),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    // controller: _passwordController,
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (value) {
                      verify['password'] = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return AdminList();
                        }));
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
