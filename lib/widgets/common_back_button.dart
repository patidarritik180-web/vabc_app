import 'package:flutter/material.dart';

class CommonLogoUi extends StatelessWidget {
  const CommonLogoUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        gradient: const RadialGradient(
          center: Alignment(-0.4, -0.4), // ~30% 30%
          radius: 1.2,
          colors: [Color(0xFFFFB76B), Color(0xFFF97316), Color(0xFFC2410C)],
          stops: [0.0, 0.6, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x99F97316), // rgba(249,115,22,0.6)
            blurRadius: 24,
            offset: Offset(0, 10),
            spreadRadius: -6,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Colors.white.withOpacity(0.002)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0),
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 16,
            height: 16,

            // Your icon/image here
            child: Image.asset(
              'assets/images/app_logo.png',
              fit: BoxFit.contain,
            ),

            // OR use Icon widget
            // child: Icon(
            //   Icons.star,
            //   size: 16,
            //   color: Colors.white,
            // ),
          ),
        ),
      ),
    );
  }
}
