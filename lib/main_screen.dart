import 'package:flutter/material.dart';
import 'package:bangla_to_arabic_dictionary/details_screen.dart';
import 'package:bangla_to_arabic_dictionary/word.dart';

class MainScreen extends StatelessWidget {
  Future<List<Word>> futureList;

  MainScreen({Key key, @required this.futureList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bangla To Arabic'),
        ),
        body: FutureBuilder(
            future: futureList,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: Text(
                  'Loading....',
                  style: TextStyle(fontSize: 20.0),
                ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(snapshot.data[index].bangla),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(word: snapshot.data[index])),
                          );
                        },
                      ));
                    });
              }
            }));
  }
}
