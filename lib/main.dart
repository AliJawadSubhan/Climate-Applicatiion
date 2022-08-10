import 'package:climateapp/screens/city_search.dart';
import 'package:climateapp/screens/splash.dart';
import 'package:climateapp/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false, 
        home: LoadingScreen());
  }
}
