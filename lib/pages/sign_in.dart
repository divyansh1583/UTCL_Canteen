import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninja_id/custom_widgets/custom_widget.dart';
import 'package:ninja_id/pages/home_page.dart';
import 'package:ninja_id/pages/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _passwordTextController=TextEditingController();
  final TextEditingController _emailTextController=TextEditingController();
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
                logo("assets/images/UTCLlogo.jpg"),
                const SizedBox(height:30,),
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
                    _emailTextController),
                const SizedBox(height: 30,),
                customTextField("Password", Icons.lock, true,
                    _passwordTextController),
                const SizedBox(height: 30,),
                signInUpButton(context, true, (){
                   FirebaseAuth.instance.signInWithEmailAndPassword(
                       email: _emailTextController.text,
                       password: _passwordTextController.text).then((value){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>const HomePage()));

                   }).onError((error, stackTrace){
                     print("Error ${error.toString()}");
                   });
                }),
                const SizedBox(height: 30,),
                signUp(),
              ],
            ),

          ),
        ),

      ),
    );
  }
  Row signUp(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const Text("Don't have a account?",
        style:TextStyle(
          color: Colors.white54,
          fontFamily: 'Karla',
        ) ,
        ),
        GestureDetector(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));},
          child:  const Text(" Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Karla',
            ),),
        )
      ]
    );
  }
}
