import 'package:acm_app/globalComponents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

import 'package:flutter/material.dart';

import 'globalComponents.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

Stream<List<Event_data>> readUsers() => FirebaseFirestore.instance
    .collection('Past_Events')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Event_data.fromJson(doc.data())).toList());

class Event_data {
  String forUpdate = '';
  final String Event;
  final String Mode;
  final String Venue;
  final timestamp;

  Event_data({required this.Event, required this.timestamp,required this.Mode, required this.Venue});

  static Event_data fromJson(Map<String, dynamic> json) =>
      Event_data(Event: json['Event'], timestamp: json['Date'], Mode: json['Mode'], Venue: json['Venue']);
}

class PastEvents extends StatelessWidget {
  late DocumentReference x;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer.Build(context),
      appBar: AppBar(
        title: Text(
          'Past events',
          style: TextStyle(fontSize: 30, fontFamily: 'NovaSquare'),
        ),
        backgroundColor: const Color(0xFF003261),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children:[
        // children: [ Container(
        //   margin: EdgeInsets.zero,
        //   height: 250,
        //   width: double.infinity,
        //   child: CustomPaint(
        //     painter: TopBar(50, const Color(0xFF003261)),
        //   ),
        // ),
          SizedBox(
            height: 50,
          ),

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
          ),
        ],
      ),
    );
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
                            'Date: ${DateTime.parse(event.timestamp.toDate().toString())}' + '\n\n' +
                            'Mode: ${event.Mode}' + '\n\n' +
                          'Venue: ${event.Venue}',
                      style:TextStyle(
                        fontWeight: FontWeight.bold
                      )),
                      onTap: () {
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) {
                          if (user != null) {
                            print(user.uid);
                          }
                        });
                      },
                    ),
                  )),
    ),
    
        ],
      ),

      //leading: CircleAvatar(child: Text(user.age),),
      //title: Text(user.fname),
      //subtitle: Text(user.city),
      onTap: () {},
    );
  }
}
