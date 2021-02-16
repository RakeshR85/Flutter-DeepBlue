import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrationServer1 extends StatefulWidget {
  @override
  _RegistrationServer1State createState() => _RegistrationServer1State();
}

class _RegistrationServer1State extends State<RegistrationServer1> {
  CollectionReference registration =
      FirebaseFirestore.instance.collection('registration');
  Map data;
  int length;
  fetchData() {
    registration.snapshots().listen((event) {
      setState(() {
        data = event.docs[0].data();
        length = event.size;
        print(length);
      });
    });
  }

  // initialize() {
  //   Firebase.initializeApp();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Server'),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: fetchData(),
            builder: (ctx, streamSnapshot) {
              return ListView.builder(
                  itemCount: length,
                  itemBuilder: (ctx, index) => Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 20,
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // 'Patient Id: ${data['patient_id']}',
                                  'Patient Id: XA123',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    // 'Dr. :${data['Doctor']}'
                                    'Dr.: Dr. Abdullah Ansari'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Type: Common Cold'),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RaisedButton(
                                      elevation: 10,
                                      onPressed: () {},
                                      child: Text(
                                        'Discard',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    RaisedButton(
                                      elevation: 10,
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('registration')
                                            .doc('hB4Jq46vve9Ml2NswTm2')
                                            .update({
                                          'desk_time': DateTime.now().toString()
                                        });
                                      },
                                      child: Text(
                                        'Serve',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    RaisedButton(
                                      elevation: 10,
                                      onPressed: () {},
                                      child: Text(
                                        'Forward',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
            }));
  }
}
