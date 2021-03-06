import 'package:flutter/material.dart';
import 'package:crud/screens/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'CRUD Admin Application',
            debugShowCheckedModeBanner: false,
            home: WelcomePage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}