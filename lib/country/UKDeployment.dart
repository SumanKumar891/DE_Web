import 'package:detest/constant.dart';
import 'package:detest/country/UKSandringham.dart';
import 'package:detest/country/UkData.dart';
import 'package:flutter/material.dart';

class UKPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        title: Text('UK Data'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UK_Screen()),
                  );
                },
                child: Text('Deployment 2023'),
                style: ElevatedButton.styleFrom(
                    // elevation: 10,
                    minimumSize: Size(200, 50),
                    backgroundColor: Color.fromARGB(164, 14, 211, 7)),
              ),
              SizedBox(height: 30), // Add some space between the buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UKSanScreen()),
                  );
                },
                child: Text('Deployment  2024'),
                style: ElevatedButton.styleFrom(
                    // elevation: 10,
                    minimumSize: Size(200, 50),
                    backgroundColor: Color.fromARGB(164, 14, 211, 7)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
