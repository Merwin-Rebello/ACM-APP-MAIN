
import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:acm_app/Authentication_service.dart';
import 'package:acm_app/firebase_options.dart';
final db = FirebaseFirestore.instance;

class GetUser {
  //final FirebaseAuth auth = FirebaseAuth.instance;

  static String? get(){
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user =  auth.currentUser;
    String? email  = user?.email;

    return email;
  }



}






class Users {

  //String fname = '';
  static String Name = "";
  static String Email = "";
  static String lastname = ""; //late final data;
  static String Phone = "";
  static String uname = "";
  static String acm_coins = "";

  //final firebaseuser = context.watch<User?>();
  static Future init() async {
    final email = GetUser.get();
    Email = await _getUserData("Email", email!);
    Name = await _getUserData("Fname", Email);
    lastname = await _getUserData("Lname", Email);
    uname = await _getUserData("Uname", Email);
    Phone = await _getUserData("Phone", Email);
    acm_coins = await _getUserData("ACMcoins", email);
    print("Name is :" + Name);
  }

  static Future<dynamic> _getUserData(String x, String y) async {
    final data;
    final docRef = db.collection("Users").doc(y);

    data = await docRef.get().then((DocumentSnapshot doc) {
      return doc.data() as Map<String, dynamic>;
    });
    if (x == 'Fname') {
      return data['Fname'];
    }
    if (x == 'Lname') {
      return data['Lname'];
    }
    if (x == 'Email') {
      return data['Email'];
    }
    if (x == 'Phone') {
      return data['Phone'];
    }
    if (x == 'Uname') {
      return data['Uname'];
    }

    if (x == 'ACMcoins') {
      return data['ACMcoins'];
    }
  }


}


