import 'package:acm_app/main.dart';
import 'package:acm_app/temp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:acm_app/workingwithgsheet.dart';

import 'Authentication_service.dart';
import 'current_user_data.dart';
class Alert{

  Future<dynamic> for_registration(BuildContext context, String x) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Registered"),
          content: Text("New User Registered,please Login again to continue!"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage()),

            );
          }, child: Text("Okay"))
          ],

        )
    );
  }

   Future<dynamic> for_Login_success(BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Successful"),
          content: Text("Login Successful"),
          actions: [TextButton(onPressed: () {Navigator.pop(context);}
              , child: Text("Okay"))
          ],

        )
    );
  }

  Future<dynamic> for_Login_fail(BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Invalid"),
          content: Text("Login Unsuccesful,check credentials"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Okay"))
          ],

        )
    );
  }

   Future<dynamic> for_Logout(BuildContext context) {
     return showDialog(context: context, builder: (context) =>
         AlertDialog(
           title: Text("Logout"),
           content: Text("Are you Sure you want  to Logout?"),
           actions: [TextButton(onPressed: () {
             Navigator.pop(context);
             context.read<AuthenticationService>().SignOut(context: context);
           }, child: Text("Okay"))
           ],

         )
     );
   }

  Future<dynamic> for_Events(BuildContext context,String en,String email,String event_name) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Event Description"),
          content: Text(en),
          actions: [TextButton(onPressed: () {
            String name = Users.Name!;
            userAPI.insert([name,"BE",30],event_name);
            AlertDialog(
              title:Text("Successfully registered"),
              content:Text(en),
              actions: [TextButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },child:Text("OK")),

              ]
            );
          }, child: Text("Register me")),
            TextButton(onPressed: (){



            //final firstRow = wwgsheets.getdetails();

              Navigator.pop(context);
              }, child: Text("OK"))
          ],

        )
    );
  }
}