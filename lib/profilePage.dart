import 'dart:developer';

import 'package:acm_app/current_user_data.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:acm_app/globalComponents.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Users user = Users();

class FormOutline extends CustomPainter {
  double widthOffset;
  double heightOffset;
  FormOutline(this.widthOffset, this.heightOffset);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBorder = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..color = const Color(0xFF003261);
    Paint paintFill = Paint();
    paintFill.color = Colors.white;
    var path = Path();
    path.moveTo(0, 10);
    path.lineTo(0, size.height - 10);
    path.quadraticBezierTo(0, size.height, 10, size.height);
    path.lineTo(size.width - 10, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 10);
    path.lineTo(size.width, 10);
    path.quadraticBezierTo(size.width, 0, size.width - 10, 0);
    path.lineTo(size.width / 2 + widthOffset, 0);
    path.quadraticBezierTo(
        size.width / 2, heightOffset, size.width / 2 - widthOffset, 0);
    path.lineTo(10, 0);
    path.quadraticBezierTo(0, 0, 0, 10);
    path.close();
    canvas.drawShadow(
        path.shift(const Offset(0, 5)), Colors.black, 10.0, false);
    canvas.drawPath(path, paintFill);
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ProfilePage extends StatefulWidget {

  const ProfilePage({required });

  @override
  State<ProfilePage> createState() => _ProfilePage();

}

class _ProfilePage extends State<ProfilePage>{

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String fname =  "Sid",
      lname = "Fernandes",
      username = "05Alston",
      email = "aeonblaze0508@gmail.com",
      phone = "+91 xxxxx xxxxx";
  @override
 Widget build(BuildContext context)    {
    Size size = MediaQuery.of(context).size;
    print(size);
    return Scaffold (
      drawer: AppDrawer.Build(context),
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: const Color(0xFF003261),
        centerTitle: false,
        toolbarHeight: 80.h,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
          Container(
          margin: EdgeInsets.zero,
            height: 210.h,
            width: double.infinity,
            child: CustomPaint(
              painter: TopBar(50.r, const Color(0xFF003261)),
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            height: 130.h,
            width: double.infinity,
            child: CustomPaint(
              painter: TopBar(70.r, const Color(0xFF003261)),
            ),
          ),
          Column(
              children: <Widget>[
          IconButton(
          // TODO: Open image picker Or replace by circle avatar
          onPressed: (() => {log("profile btn clicked")}),
      iconSize: 100.r,
      icon: const Icon(
        Icons.account_circle_outlined,
      ),
      color: Colors.white,
    ),
    SizedBox(
    height: 5.h,
    ),
    TextButton.icon(
    // TODO: Redirect to points page
    onPressed: (() => {log("wallet btn clicked")}),
    icon: Icon(
    Icons.account_balance_wallet_rounded,
    size: 12.sp,
    ),
    style: TextButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: const Color(0xFF003261).withOpacity(0.6),
    elevation: 5,
    minimumSize: Size(60.w, 30.h),
    ),
    label:Text(Users.acm_coins)),
    // FutureBuilder(future:getdata('ACMcoins'),
    // builder: (context,snapshot){
    // if (snapshot.hasData) {
    // return Text('${snapshot.data!.toString()}');
    // }
    // else{
    // return CircularProgressIndicator();
    // }
    // })),

    // Text(
    // "200",
    // style: TextStyle(fontSize: 16.sp),
    // ),
    // ),
    SizedBox(
    height: 10.h,
    ),
    Card(
    color: Colors.white,
    // margin: const EdgeInsets.all(15),
    shape: const RoundedRectangleBorder(
    borderRadius:
    // TODO: calculate radii based on username field value
    BorderRadius.all(Radius.elliptical(300, 170)),
    ),
    elevation: 5,
    shadowColor: Colors.black,
    child: Container(
    margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    child:Text(Users.uname),
    // FutureBuilder(future:getdata('Username'),
    //     builder: (context,snapshot){
    //       if (snapshot.hasData) {
    //         return Text(Users.uname);
    //       }
    //       else{
    //         return CircularProgressIndicator();
    //       }
    //     })
    // child: Text(
    // username,
    // style: TextStyle(
    // fontSize: 18.sp,
    // fontWeight: FontWeight.bold,
    // ),
    // ),
    ),
    ),
    Container(
    margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 50),
    child: CustomPaint(
    // TODO: calculate radii based on username field value
    painter: FormOutline(100.w, 50.h),
    child: Column(
    children:<Widget>[
    const SizedBox(
    height: 50,
    ),
    profileInfo('Name', Users.Name),
      profileInfo('Last Name ', Users.lastname),
      profileInfo('Email', Users.Email),
      profileInfo('Contact', Users.Phone),

    // // FutureBuilder(future:getdata('Fname'),
    // //     builder: (context,snapshot){
    // //   if (snapshot.hasData) {
    // //     return profileInfo('Name',Users.Name);
    // //   }
    // // else{
    // //   return CircularProgressIndicator();
    // //   }
    // // }),
    //   FutureBuilder(future:getdata('Lname'),
    //       builder: (context,snapshot){
    //         return profileInfo('Last Name', Users.lastname);
    //       }),
    //   FutureBuilder(future:getdata('Email'),
    //       builder: (context,snapshot){
    //         if (snapshot.hasData) {
    //           return profileInfo('Email', Users.Email);
    //         }
    //         else{
    //           return CircularProgressIndicator();
    //         }
    //       }),
    //   FutureBuilder(future:getdata('Phone'),
    //       builder: (context,snapshot){
    //         if (snapshot.hasData) {
    //           return profileInfo('Phone', Users.Phone);
    //         }
    //         else{
    //           return CircularProgressIndicator();
    //         }
    //       }),

          // return (Padding(
          //   padding: EdgeInsets.only(bottom: 30.h, left: 10.w, right: 10.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       SizedBox(
          //         width: 110.w,
          //         child: TextButton(
          //           onPressed: () => 'Null',
          //           style: TextButton.styleFrom(
          //             backgroundColor: Colors.white,
          //             foregroundColor: const Color(0xFF003261),
          //           ),
          //           child: Padding(
          //             padding: EdgeInsets.all(4.r),
          //             child: Align(
          //               alignment: Alignment.centerLeft,
          //               child: Text('Name',
          //                 style: TextStyle(
          //                   fontSize: 16.sp,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: TextFormField(
          //           decoration: buildInputDecoration(
          //             // Icons.person,
          //               snapshot.data!.toString(),),
          //           enabled: false,
          //         ),
          //       ),
          //     ],
          //   ),
          // ));

    //profileInfo("First Name",   "Siddhesh"),
    // profileInfo("Last Name",  fname),
    // profileInfo("Phone no.", fname),
    // profileInfo("Username", fname),
    // profileInfo("Email", fname),
    SizedBox(
    height: 10.h,
    ),
    // Form(
    // key: _formkey,
    // child: Column(
    // mainAxisAlignment: MainAxisAlignment.center,
    // children: <Widget>[
    // Container(
    // margin:
    // EdgeInsets.only(left: 10.w, right: 10.w),
    // child: Row(
    // mainAxisAlignment:
    // MainAxisAlignment.spaceBetween,
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: [
    // SizedBox(
    // width: 110.w,
    // child: TextButton(
    // onPressed: () => 'Null',
    // style: TextButton.styleFrom(
    // backgroundColor: Colors.white,
    // foregroundColor:
    // const Color(0xFF003261),
    // ),
    // child: Padding(
    // padding: const EdgeInsets.all(4),
    // child: Align(
    // alignment: Alignment.centerLeft,
    // child: Text(
    // "Change Password",
    // style: TextStyle(
    // fontSize: 16.sp,
    // ),
    // ),
    // ),
    // ),
    // ),
    // ),
    // Expanded(
    // child: SizedBox(
    // height: 90.h,
    // child: TextFormField(
    // controller: password,
    // keyboardType: TextInputType.text,
    // decoration: buildInputDecoration(
    // "Change Password"),
    // validator: (String? value) {
    // if (value!.isEmpty) {
    // return 'Empty';
    // }
    // return null;
    // },
    // ),
    // ),
    // ),
    // ],
    // ),
    // ),
    // Container(
    // margin:
    // EdgeInsets.only(left: 10.w, right: 10.w),
    // child: Row(
    // mainAxisAlignment:
    // MainAxisAlignment.spaceBetween,
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: [
    // SizedBox(
    // width: 110.w,
    // child: TextButton(
    // onPressed: () => 'Null',
    // style: TextButton.styleFrom(
    // backgroundColor: Colors.white,
    // foregroundColor:
    // const Color(0xFF003261),
    // ),
    // child: Padding(
    // padding: const EdgeInsets.all(4),
    // child: Align(
    // alignment: Alignment.topLeft,
    // child: Text(
    // "Confirm Password",
    // style: TextStyle(
    // fontSize: 16.sp,
    // ),
    // ),
    // ),
    // ),
    // ),
    // ),
    // Expanded(
    // child: SizedBox(
    // height: 90.h,
    // child: TextFormField(
    // controller: confirmpassword,
    // obscureText: true,
    // keyboardType: TextInputType.text,
    // decoration: buildInputDecoration(
    // "Confirm Password"),
    // validator: (String? value) {
    // if (value!.isEmpty) {
    // return "Empty";
    // }
    // log(password.text);
    // log(confirmpassword.text);
    // if (password.text !=
    // confirmpassword.text) {
    // return "Password does not match";
    // }
    // return null;
    // },
    // ),
    // ),
    // ),
    // ],
    // ),
    // ),
    // SizedBox(
    // width: 180.w,
    // height: 60.h,
    // child: TextButton(
    // onPressed: ()  async {
    //
    //
    // print( await  user.getUserData('Fname'));
    //
    // bool? isValid =
    // _formkey.currentState?.validate();
    // if (isValid!) {
    // log("successful");
    // return;
    // } else {
    // log("UnSuccessfull");
    // }
    // },
    // style: TextButton.styleFrom(
    // textStyle: TextStyle(fontSize: 18.sp),
    // foregroundColor: Colors.white,
    // backgroundColor: const Color(0xFF003261),
    // shape: RoundedRectangleBorder(
    // borderRadius:
    // BorderRadius.circular(50.0),
    // )),
    // child: const Text("Update Profile"),
    // ),
    // ),
    // SizedBox(
    // height: 20.h,
    // ),
    // ],
    // ),
    // ),
    ],
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );

  }

  Widget profileInfo(String contentQ,String x) {
    return (Padding(
      padding: EdgeInsets.only(bottom: 30.h, left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 110.w,
            child: TextButton(
              onPressed: () => 'Null',
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF003261),
              ),
              child: Padding(
                padding: EdgeInsets.all(4.r),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    contentQ,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: buildInputDecoration(
                  // Icons.person,
                 x),
              enabled: false,
            ),
          ),
        ],
      ),
    ));
  }


  Future<dynamic> getdata(String x) async {
    //await Future.delayed(Duration(seconds: 4));
    Users u= Users();
    if (x=='Fname'){
    //final name = u.getUserData('Fname');
      final name = Users.Name;

    return name;}
    if (x=='Lname'){
      //final lname = u.getUserData('Lname');
      return lname;
    }

    if (x=='Email'){
      //final email = u.getUserData('Email');
      return email;
    }
    if (x=='Phone'){
      //final phone= u.getUserData('Phone');
      return phone;
    }
    if (x=='Username'){
      //final un= u.getUserData('Username');
      //return un;
    }
    if (x=='ACMcoins'){
      //final un= u.getUserData('ACMcoins');
      //return un;
    }

  }
}
