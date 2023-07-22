import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ninja_id/pages/sign_in.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: SignInPage()));

}
