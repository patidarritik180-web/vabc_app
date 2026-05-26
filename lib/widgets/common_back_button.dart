import 'package:flutter/material.dart';

class CommonLogoUi extends StatelessWidget {
  const CommonLogoUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      margin: EdgeInsets.only(right: 10),

      child: Image.asset("assets/images/logo 1 2.png"),
    );
  }
}
