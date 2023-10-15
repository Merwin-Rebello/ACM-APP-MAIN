import "package:flutter/material.dart";
import 'package:acm_app/globalComponents.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer.Build(context),
      appBar: AppBar(
        title: Text(
          "Contact Us",
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
                Container(
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    backgroundImage: const AssetImage('assets/acm.png'),
                    radius: 60.r,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                  onPressed: (() => {print("Redirected to dbit.acm.org")}),
                  style: TextButton.styleFrom(
                      elevation: 1,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.all(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Website",
                        style: TextStyle(fontSize: 16.sp),
                      ), // <-- Text
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Ionicons.open_outline,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: 450.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF003261), //color of border
                        width: 6, //width of border
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              // TODO: Open linkedIn
                              onPressed: (() =>
                                  {print("Redirect to LinkedIn")}),
                              iconSize: 60.r,
                              icon: const Icon(
                                Ionicons.logo_linkedin,
                              ),
                              color: const Color(0xFF003261),
                            ),
                            IconButton(
                              // TODO: Open instagram
                              onPressed: (() =>
                                  {print("Redirect to instagram")}),
                              iconSize: 60.r,
                              icon: const Icon(
                                Ionicons.logo_instagram,
                              ),
                              color: const Color(0xFF003261),
                            ),
                            IconButton(
                              // TODO: Open youtube
                              onPressed: (() => {print("Redirect to Youtube")}),
                              iconSize: 60.r,
                              icon: const Icon(
                                Ionicons.logo_youtube,
                              ),
                              color: const Color(0xFF003261),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25.w, 15, 25.w, 0),
                          child: TextFormField(
                            minLines: 7,
                            maxLines: 7,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration("Query"),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Cannot be blank';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 180.w,
                              height: 60.h,
                              child: TextButton(
                                onPressed: () {
                                  bool? isValid =
                                      _formkey.currentState?.validate();
                                  if (isValid!) {
                                    print("successful");
                                    return;
                                  } else {
                                    print("UnSuccessfull");
                                  }
                                },
                                style: TextButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 18.sp),
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xFF003261),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    )),
                                child: const Text("Send Message"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
