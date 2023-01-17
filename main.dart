import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(const MyApp());

  var db = FirebaseFirestore.instance;

  final docRef = db.collection("testab").doc("testab");
  docRef.get().then(
        (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;

      print(data.values);

    },
    onError: (e) => print("Error getting document: $e"),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: (
                    Text(
                      "teste123",
                      style: TextStyle(fontSize: 28,),
                      textAlign: TextAlign.center,
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
