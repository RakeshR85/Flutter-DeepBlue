import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'predicted_time_registration.dart';
import 'testbasis/number_of_documents.dart';

class JoinRegistration extends StatefulWidget {
  @override
  _JoinRegistrationState createState() => _JoinRegistrationState();
}

class _JoinRegistrationState extends State<JoinRegistration> {
  void navigate(BuildContext context) {
    var reference = Documents();
    int count = reference.getNumber();
    print(count);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PredictRegistration()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Join Queue",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/queue.jpg',
                  fit: BoxFit.cover,
                ),
                width: 160,
                height: 105,
              ),
              SizedBox(
                width: 14.7,
              ),
              Card(
                child: Container(
                  child: Text(
                    "Predicted Wait Time\n\n\nXYZ Minutes",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5),
                    textAlign: TextAlign.center,
                  ),
                  width: 157,
                  height: 105,
                  padding: EdgeInsets.all(20),
                ),
                color: Colors.white,
                elevation: 10,
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "REGISTRATION",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Image.asset(
              'assets/registration.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                child: Text(
                  'Join Registration Queue',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  FirebaseFirestore.instance.collection('registration').add({
                    'join_time': DateTime.now().toString(),
                  });

                  navigate(context);
                }),
          ),
        ],
      ),
    );
  }
}
