import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/signin_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: TextButton(onPressed: ()async{
         await FirebaseAuth.instance.signOut();
         Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
      
        }, child: Text('log Out')),
      )
    );
  }
}