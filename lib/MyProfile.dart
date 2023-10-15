import 'package:acm_app/current_user_data.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
  
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body:Center(
        child:FutureBuilder(
          future: getdata(),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              Object data = snapshot.data!;
              return Text('$data');
            }
            else{
              return Text('waiting');
            }
          },
        ),
      ) ,
    );
  }

  Future<dynamic> getdata() async {
    //await Future.delayed(Duration(seconds: 4));
    Users u= Users();
    final name = Users.Name;

    return name;
  }
}
