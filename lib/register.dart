import 'package:acm_app/create_user.dart';
import 'package:flutter/Material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:acm_app/Authentication_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  String g="";


  final TextEditingController name = TextEditingController();
  final TextEditingController college = TextEditingController();
  final TextEditingController dept = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController contact = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Register New User', style: TextStyle(
              fontSize: 30,
              fontFamily: 'NovaSquare'
          ),),
          backgroundColor: Colors.tealAccent[400],
          foregroundColor: Colors.black,
          centerTitle: true,),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Basic Details", style:
                  TextStyle(fontFamily: 'NovaSquare',
                    fontSize: 30,)),
                  Divider(height: 20.0, thickness: 10.0,),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      child: TextField(
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            labelText: 'First Name',
                            labelStyle: TextStyle(

                                color: Colors.white
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(),

                          ),
                              controller: name

                      )),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  labelStyle: TextStyle(

                      color: Colors.white
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(),

                ),
                controller: college

            ),
            TextField(
                decoration: InputDecoration(
                  hintText: 'department',
                  labelText: 'department',
                  labelStyle: TextStyle(

                      color: Colors.white
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(),

                ),
                controller: dept


            ),
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'year',
                        labelText: 'year',
                        labelStyle: TextStyle(

                            color: Colors.white
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey,
                        filled: true,
                        border: OutlineInputBorder(),

                      ),
                      controller: year


                  ),
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'contact',
                        labelText: 'contact',
                        labelStyle: TextStyle(

                            color: Colors.white
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey,
                        filled: true,
                        border: OutlineInputBorder(),

                      ),
                      controller: contact


                  ),

                  ElevatedButton(onPressed: (){

                    // final x = CreateUser(FName: first.text,Email: email.text,Pass: pass.text);
                    // x.addUser(context);
                    //
                    // context.read<AuthenticationService>().signUp(
                    //     email: email.text, pass: pass.text);
                  }, child: Text("Click to add details"))
                ]

            )
        )
    );
  }



  }

