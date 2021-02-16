import 'package:flutter/material.dart';

class PredictBilling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Billing Queue",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
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
            height: 80,
          ),
          Text(
            "Time until you reach the Billing desk",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(35),
              width: 157,
              height: 105,
              child: Text(
                'MM:SS',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
