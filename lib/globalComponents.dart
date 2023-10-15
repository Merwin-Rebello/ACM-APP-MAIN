import 'package:acm_app/MyProfile.dart';
import 'package:acm_app/past_events.dart';
import 'package:acm_app/popups.dart';
import 'package:acm_app/profilePage.dart';
import 'package:acm_app/teknack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contactPage.dart';
import 'courses.dart';
import 'current_user_data.dart';

InputDecoration buildInputDecoration(String hinttext) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 0),
    hintText: hinttext,
    hintStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Color(0xFF003261), width: 4),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Color(0xFF003261), width: 4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 4,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 4,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: Colors.black38,
        width: 4,
      ),
    ),
  );
}

class TopBar extends CustomPainter {
  double offset;
  Color col;
  TopBar(this.offset, this.col);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = col;
    var path = Path();
    path.lineTo(0, size.height - offset);
    path.quadraticBezierTo(
        size.width / 2, size.height + offset, size.width, size.height - offset);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawShadow(
        path.shift(const Offset(0, -1)), Colors.black, 10.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AppDrawer {
  static Widget Build(BuildContext context) {
    var y = Alert();
    return Drawer(
      width: 0.6.sw,
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF003261),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 178.0.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: const NetworkImage(
                      'https://picsum.photos/id/237/200/300',
                    ),
                    radius: 30.r,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Users.Name),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton.icon(
                          // TODO: Redirect to points page
                          onPressed: (() => {print("wallet btn clicked")}),
                          icon: Icon(
                            Icons.account_balance_wallet_rounded,
                            size: 12.sp,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF003261),
                            elevation: 5,
                            minimumSize: Size(60.w, 30.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          label: Text(Users.acm_coins),
                          // FutureBuilder(future:getdata('ACMcoins'),
                          //     builder: (context,snapshot){
                          //       if (snapshot.hasData) {
                          //         return Text(snapshot.data.toString());
                          //       }
                          //       else{
                          //         return CircularProgressIndicator();
                          //       }
                          //     })
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () => {
              Navigator.of(context).pushReplacementNamed('/mainpage'),
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('temp'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyProfile(),
                ),
              ),
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text('Teknack'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Teknack(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_rounded),
            title: const Text('Past Events'),
            onTap: () async {
              DocumentReference ds = await FirebaseFirestore.instance
                  .collection('Past_Events')
                  .doc();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PastEvents()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('Competitions'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Courses'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Courses(),
                ),
              ),
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Contact'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactUsPage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.developer_board),
            title: const Text('Developed by'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () => {
              y.for_Logout(context),
            },
          ),
        ],
      ),
    );
  }
}


Future<dynamic> getdata(String x) async {
  //await Future.delayed(Duration(seconds: 4));
  Users u = Users();
  if (x == 'Fname') {
    final name = Users.Name;

    return name;
  }
  if (x == 'ACMcoins') {
    final name = Users.Name;

    return name;
  }
}