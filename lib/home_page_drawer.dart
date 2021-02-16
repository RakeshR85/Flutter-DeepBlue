import 'package:flutter/material.dart';
import 'package:pqt_third/admin_authentication.dart';
import 'package:pqt_third/home_page.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text("Menu",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26)),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15),
            color: Colors.blue,
            height: 90,
            width: double.infinity,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomePage();
              }));
            },
          ),
          ListTile(
              leading: Icon(Icons.login),
              title: Text(
                "Login as Admin",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AdminAuthentication();
                }));
              })
        ],
      ),
    );
  }
}
