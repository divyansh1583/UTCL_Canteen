import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ninja_id/main.dart';

import '../custom_widgets/custom_widget.dart';
import 'home_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _passwordTextController=TextEditingController();
  final TextEditingController _emailTextController=TextEditingController();
  final TextEditingController _usernameTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.2, 20, 0),
            child: Column(
              children: [
                // logo("assets/images/UTCLlogo.jpg"),
                const Text('Sign Up to',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Karla',
                  ),),
                const SizedBox(height:10,),
                const Text('Baga Cement Works',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Karla',
                  ),),
                const Text('Canteen',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Karla',
                  ),),

                const SizedBox(height:30,),
                customTextField("Username", Icons.person_outline, false,
                    _usernameTextController),
                const SizedBox(height:30,),
                customTextField("Email", Icons.email_outlined, false,
                    _emailTextController),
                const SizedBox(height: 30,),
                customTextField("Password", Icons.lock, true,
                    _passwordTextController),
                const SizedBox(height: 30,),
                signInUpButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                         print("Created New Account");
                         Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const HomePage()));
                  }).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                  });
                }),
              ],
            ),

          ),
        ),

      ),
    );
  }
}

