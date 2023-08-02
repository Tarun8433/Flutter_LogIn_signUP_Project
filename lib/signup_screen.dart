import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_text_field.dart';
import 'package:flutter_application_1/signin_screen.dart';

// Sign Up Screen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final userNameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confermPasswordController = TextEditingController();
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 139, 67),
        title: const Text('Sign Up'),
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
                  height: 600,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: (Column(
                      children: [
                        const SizedBox(height: 20),

                        // User Name TextField

                        MyTextField(
                          controller: userNameController,
                          hintText: 'User Name',
                          obscreText: false,
                        ),

                        // Phone Number TextField

                        const SizedBox(height: 20),

                        MyTextField(
                          controller: phoneNumberController,
                          hintText: 'Phone Number',
                          obscreText: false,
                        ),

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
                          onChanged: (value){
                            email=value;
                          }
                        ),

                        const SizedBox(height: 20),

                        // Password TextField

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
                          onChanged: (value){
                            pass=value;
                          }
                        ),

                        // Conferm Password
                        const SizedBox(height: 20),

                        MyTextField(
                          controller: confermPasswordController,
                          hintText: 'Conferm Password',
                          obscreText: true,
                        ),

                        // Button

                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {
                            signUp();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Sign In Button

                        const Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),

                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()));
                            },
                            child: const Text(
                              'Sign In',
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

  Future signUp() async {
   
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      return credential;
    } catch (e) {
      print(e);
    }
  }
}


