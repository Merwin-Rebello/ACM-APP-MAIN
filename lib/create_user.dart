
import 'package:flutter/material.dart';

import 'package:acm_app/popups.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:acm_app/Authentication_service.dart';

class CreateUser{
  final x = Alert();
  final String FName;
  final String Email;
  final String Pass;
  final user = FirebaseAuth.instance.currentUser;

  CreateUser({required this.FName,required this.Email,required this.Pass});
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  get value => null;

  Future<void> addUser(BuildContext context) {
    print(user?.uid);


    // Call the user's CollectionReference to add a new user
    return users.doc(FName).
    set({
      'first_name': FName.toString(),
      'email':Email.toString(),
      'pass':Pass.toString()
    })
        .then((value)=>  print("success"))




        .catchError((error) => print("Failed to add user: $error"));
  }
}