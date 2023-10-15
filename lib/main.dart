import 'package:acm_app/MainPage.dart';
import 'package:acm_app/contactPage.dart';
import 'package:acm_app/past_events.dart';
import 'package:acm_app/popups.dart';
import 'package:acm_app/register.dart';
import 'package:acm_app/splashscreen.dart';
import 'package:acm_app/temp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:acm_app/profilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:acm_app/firebase_options.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:acm_app/Authentication_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'current_user_data.dart';
final navigatorKey = GlobalKey<NavigatorState>();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
      'This channel is used for important notifications.',
  playSound: true,
  importance: Importance.high
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   await userAPI.init();
   await Users.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await ScreenUtil.ensureScreenSize();


  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(ScreenUtil().screenWidth);
    // print(ScreenUtil().screenHeight);
   return MultiProvider(providers: [
     Provider<AuthenticationService>(
       create: (_) =>AuthenticationService(FirebaseAuth.instance),
     ),

     StreamProvider(create: (context) =>context.read<AuthenticationService>().authStateChanges, initialData: null,
     )
   ],
    child:ScreenUtilInit(
      designSize: const Size(360, 800),
      // designSize: Size(ScreenUtil().screenWidth, ScreenUtil().screenHeight),
      builder: (context, child) {

          return MaterialApp(
            navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: <String, WidgetBuilder>{
          '/login': (_) => const LoginPage(),
          '/mainpage': (_) => MainPage(),
          '/profilePage': (_) => const ProfilePage(),
          '/contactPage': (_) => const ContactUsPage(),
          '/register': (_) => const Register(),
        },
      );
      // ),

    }
    )
   );}
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;
  //const LoginPage({Key? key}) : super(key: key);
  TextEditingController? userid = TextEditingController();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? pass = TextEditingController();
  bool secureText = true;

  @override
  void initState(){

    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android= message.notification?.android;
      if(notification != null && android != null){

            flutterLocalNotificationsPlugin.show(
                notification.hashCode,
                notification.title,
                notification.body,
                NotificationDetails(
                  android: AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    channelDescription: channel.description,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher',
                  ),
                )
        );
      }
    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    if (firebaseuser == null) {
      return Scaffold(
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Card(
                        color: Colors.white,
                        // margin: const EdgeInsets.all(15),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(157.0)),
                        ),
                        elevation: 5,
                        shadowColor: Colors.black,
                        // child: SizedBox(
                        //   width: 157,
                        //   height: 157,
                        // ),
                        child: CircleAvatar(
                          backgroundImage: const AssetImage('assets/acm.png'),
                          radius: 80.r,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.r),
                        margin: EdgeInsets.all(5.r),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text("Log in to continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF003261),
                                  fontFamily: 'NovaSquare')),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        margin: EdgeInsets.all(20.r),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Email id',
                              labelText: 'Email id',
                              labelStyle: const TextStyle(color: Colors.black),
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(30, 20.h, 20, 20.h),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: const Icon(
                                Icons.person_outline,
                                size: 24,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xFF003261),
                                  width: 4.0,
                                ),
                              ),
                            ),
                            controller: userid,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        margin: EdgeInsets.all(20.r),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.black),
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(30, 20.h, 20, 20.h),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xFF003261),
                                  width: 2.0,
                                ),
                              ),
                              // suffixIcon: const Icon(Ionicons.key_outline),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.remove_red_eye_rounded,
                                  size: 24,
                                ),
                                onPressed: () {
                                  setState(() {
                                    secureText = !secureText;
                                  });
                                },
                              ),
                            ),
                            controller: pass,
                            //key:_formKey,
                            obscureText: secureText,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(80.w, 0, 40, 40.h),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: ElevatedButton(
                            onPressed: () {
                              if (userid!.text != null && pass!.text != null) {
                                context.read<AuthenticationService>().signIn(
                                    email: userid!.text.trim(),
                                    pass: pass!.text.trim(),
                                    context: context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(30, 10.h, 30, 20.h),
                                backgroundColor: const Color(0xFF003261),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    fontFamily: 'NovaSquare', fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.w, 0, 40.w, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Don\'t have account?',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF003261),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/register');
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      );
    } else {
      return MainPage();
    }
  }
}
