import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _redirectCalled = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height:50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Welcome to official ACM app!",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),)],
          ),
          SizedBox(height: 25,),
          CircleAvatar(
            backgroundImage: AssetImage('assets/acm.png'),

            radius: 50.0,
          ),
          SizedBox(height: 25,),
          Center(child: CircularProgressIndicator()),
          SizedBox(height: 25,),
          ElevatedButton(onPressed: (){Navigator.of(context).pushReplacementNamed('/login');}, child: Text("Click to proceed"))
        ],
      ),
    );
  }
}
