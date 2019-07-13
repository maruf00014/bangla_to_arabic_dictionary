import 'dart:io';
import 'dart:typed_data';

import 'package:bangla_to_arabic_dictionary/word.dart';
import 'package:flutter/material.dart';
import 'package:bangla_to_arabic_dictionary/main_screen.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MaterialApp(
    title: 'Bangla To Arabic',
    theme: ThemeData(
        primaryColor: Colors.green[700], primaryColorDark: Colors.green[900]),
    home: MainScreen(futureList: getData()),
  ));
}

Future<List<Word>> getDataFromDatabase(String databasePath) async {
  List<Word> wordList = List();

  var db = await openDatabase(databasePath);

  var dataSnapshot = await db.rawQuery('SELECT * from Table1');

  for (Map<String, dynamic> item in dataSnapshot) {
    wordList.add(Word(
        item['id'], item['bangla'], item['arabic'], item['pronunciation']));
  }

  db.close();

  return wordList;
}

Future<List<Word>> getData() async {
  List<Word> wordList = List();

  var path = await getDatabasesPath();

  var databasePath = join(path, 'database.db');

  debugPrint(databasePath);

  var exits = await databaseExists(databasePath);

  if (exits) {
    wordList = await getDataFromDatabase(databasePath);
  } else {
    try {
      await Directory(dirname(databasePath)).create(recursive: true);
    } catch (_) {}

    var data = await rootBundle.load('assets/database.db');

    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(databasePath).writeAsBytes(bytes);

    wordList = await getDataFromDatabase(databasePath);
  }

  return wordList;
}
