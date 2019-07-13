import 'package:flutter/material.dart';
import 'package:bangla_to_arabic_dictionary/word.dart';

class DetailScreen extends StatelessWidget {
  final Word word;

  DetailScreen({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bangla To Arabic"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        width: double.infinity,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                word.bangla,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                word.arabic,
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                word.pronunciation,
                style: TextStyle(fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
