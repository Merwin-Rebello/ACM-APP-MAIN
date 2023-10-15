import 'package:acm_app/contactPage.dart';
import 'package:acm_app/courses.dart';
import 'package:acm_app/current_user_data.dart';
import 'package:acm_app/popups.dart';
import 'package:acm_app/teknack.dart';
import "package:flutter/material.dart";
import 'globalComponents.dart';
import 'main.dart';
import 'profilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:acm_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:acm_app/Authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acm_app/temp.dart';




class MainPage extends StatefulWidget {


  MainPage()   {


  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late DocumentReference x;

  final y = Alert();

  String? email = '';


  late String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer.Build(context),

      appBar: AppBar(
          title:Text("Hello " + Users.uname),
        // title:FutureBuilder(
        //     //future:getdata('Fname'),
        //     future:  Users.init(),
        //         builder: (context,snapshot){
        //
        //       if (snapshot.hasData) {
        //
        //         return Text('Hello '+' ${Users.Name}');
        //
        //       }
        //       else{
        //         return CircularProgressIndicator();
        //
        //       }
        //     }),
        backgroundColor: const Color(0xFF003261),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.blueGrey,
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.lightbulb)),
        //   SizedBox(
        //     width: 15,
        //   )
        // ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              // Container(
              //   margin: EdgeInsets.zero,
              //   height: 250,
              //   width: double.infinity,
              //   child: CustomPaint(
              //     painter: TopBar(50, const Color(0xFF003261)),
              //   ),
              // ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Upcoming  events",
                          style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    // FloatingActionButton(onPressed: (){
                    //       //userAPI.insert(["Siddhesh",20]);
                    // })],
                  ]),
                  Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(10.0),
                      //   margin: EdgeInsets.all(10.0),
                      //   child: TextField(
                      //
                      //
                      //     decoration: InputDecoration(
                      //       //hintText: 'Filter by City',
                      //       labelText: 'Search event',
                      //       labelStyle: TextStyle(
                      //
                      //           color: Colors.white
                      //       ),
                      //       hintStyle: TextStyle(
                      //         color: Colors.black,
                      //       ),
                      //       fillColor: Colors.grey,
                      //       filled: true,
                      //       border: OutlineInputBorder(),
                      //
                      //
                      //     ),
                      //
                      //
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),


    ]
          ),
          SizedBox(height: 50,),
          Flexible(
            child: StreamBuilder<List<Event_data>>(
              stream: readUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  final events = snapshot.data!;

                  return ListView(
                    children: events.map(buildUser).toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),],
      )

    );

  }

    Future<dynamic> getdata(String x) async {
      //await Future.delayed(Duration(seconds: 4));

      if (x=='Fname'){
        //final name = user.getUserData('Fname');
        final name = Users.Name;

        return name;}
      if (x=='Lname'){
        // final lname = user.getUserData('Lname');
        final lname = Users.Name;
        return lname;
      }
  }
}
Stream<List<Event_data>> readUsers() => FirebaseFirestore.instance
    .collection('Upcoming_Events')
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => Event_data.fromJson(doc.data())).toList());

class Event_data {
  String forUpdate = '';
  final String Event;
  final String Event_descp;
  final timestamp;

  var popup = Alert();

  Event_data({required this.Event, required this.Event_descp, required this.timestamp}){

  }

  static Event_data fromJson(Map<String, dynamic> json) =>
      Event_data(Event: json['Event'],Event_descp: json['Description'],timestamp: json['Date']);
}
Widget buildUser(Event_data event) {

  return ListTile(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
          child:  Card(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(
                    color:const Color(0xFF003261),
                  )

              ),
              child: Container(

                child: ListTile(

                  trailing: const Icon(
                    Icons.arrow_right_rounded,
                    size: 48,
                  ),
                  title:  Text(
                      'Event: ${event.Event}' + '\n\n' +
                          'Date: ${DateTime.parse(event.timestamp.toDate().toString())}',
                      style:TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                  onTap: ()  {
                    GetUser g = GetUser();
                    //String? x =  g.get();
                    //print(x);




                   showmydialog(event.Event_descp,"hello",event.Event);
                    print(event.Event_descp);
                  },
                ),
)),


        )],
    ),

    //leading: CircleAvatar(child: Text(user.age),),
    //title: Text(user.fname),
    //subtitle: Text(user.city),
    onTap: () {},
  );
}

void showmydialog(en,email,event){
  var popup = Alert();
  popup.for_Events(navigatorKey.currentContext!,en,email,event);
}