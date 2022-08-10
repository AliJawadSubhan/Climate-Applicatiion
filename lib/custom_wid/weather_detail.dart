

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';


class TestingWidget extends StatefulWidget {
  TestingWidget({Key? key, required this.url, required this.text})
      : super(key: key);

  String url;
  String text;

  @override
  State<TestingWidget> createState() => _TestingWidgetState();
}

class _TestingWidgetState extends State<TestingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 80,
          width: 120,
          // color: const Color(0xFFF8F8F8),
          child: Center(
            child: Image(
              color: Color(0xFFFFFBFF),
              image: AssetImage(widget.url),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          widget.text,
          style: GoogleFonts.quicksand(color: Color(0xFFFFFBFF), fontSize: 22),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
