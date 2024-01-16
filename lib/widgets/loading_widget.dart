import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/flutter_map_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FlutterMapScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              width: 500.0,
              height: 500.0,
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
