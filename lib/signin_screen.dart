// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signup_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 139, 67),
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 0, 139, 67),
                  ),
                  height: 550,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: (Column(
                      children: [
                        const SizedBox(height: 20),

                        // Email TextField

                        const SizedBox(height: 20),

                        TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 36, 7, 255)),
                              ),
                              fillColor: Colors.white,
                              hintText: 'Email',
                              filled: true,
                            ),
                            onChanged: (value) {
                              email = value;
                            }),

                        // Email TextField

                        const SizedBox(height: 20),

                        TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 36, 7, 255)),
                              ),
                              fillColor: Colors.white,
                              hintText: 'Password',
                              filled: true,
                            ),
                            onChanged: (value) {
                              password = value;
                            }),

                        // Button

                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {
                            signIn();
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),

                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpScreen()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.amber),
                            )),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
  
     await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>const Home(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('User not Found'), backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wrong password provided for that user.'),backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),),
        );
      }
    }
  }
}
