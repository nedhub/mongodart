import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() async {
  Db db = Db('mongodb://localhost:27017/test');
  await db.open();

  // print("Connected to database");

  DbCollection collection = db.collection('fake');

  //TODO

  // var people = await collection.find(where.eq('name', 'Darius Gunn')).toList();
  // print(people);

  var fake = await collection.find().toList();

  print(fake);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Display(),
    );
  }
}

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, child: Text(fake)),
    );
  }
}
