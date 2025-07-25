import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [SvgPicture.asset('assets/svgs/low_opacity_logo.svg')],
          ),
        ),
      ),
    );
  }
}
