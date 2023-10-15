

import 'package:acm_app/popups.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'current_user_data.dart';



class AuthenticationService{
  final y = Alert();
  final user = FirebaseAuth.instance.currentUser;

  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges =>_firebaseAuth.authStateChanges();
  Future<String?> SignOut({required BuildContext context}) async{
    await _firebaseAuth.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  static Future init() async {
    await Users.init();
  }
  Future<void> signIn({required String email,required String pass,required BuildContext context}) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);


      if (FirebaseAuth.instance.currentUser != null) {

        print(user?.uid);
        print("correct user id");
        y.for_Login_success(context);
        await Users.init();

      }

    }
    on FirebaseAuthException catch(e){
      print("wrong credentials");
    y.for_Login_fail(context);


    }
  }

  Future<String?> signUp({required String email,required String pass}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      return "Signed in";
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}

