import 'package:cloud_firestore/cloud_firestore.dart';




class EventRegistration{

  late DocumentReference d;

  EventRegistration({required this.d});

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future <void> updateUser(String docName,String Conn,String city,String Mobile){
    return users
        .doc(d.id)
        .update({'Conn':FieldValue.arrayUnion([Conn+','+city+','+Mobile])}).then((value) => print("Value updated"))
        .catchError((error)=>print("Error"));


  }
}
