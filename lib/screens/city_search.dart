import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          // constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "images/citybg.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1,
              sigmaY: 1,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      hoverColor: Colors.black,
                      contentPadding: const EdgeInsets.all(12),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'City Name',
                      hintStyle: const TextStyle(color: Colors.grey),
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (newvalue) {
                      cityName = newvalue;
                      print(cityName);
                    },
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text(
                      "Search Weather!",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
