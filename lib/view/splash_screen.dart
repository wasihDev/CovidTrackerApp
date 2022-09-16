import 'dart:async';

import 'package:apis/view/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _contoller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WorldStatesScreen())));
  }

  @override
  void dispose() {
    _contoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _contoller,
              child: SizedBox(
                  height: height / 3,
                  width: width / 3,
                  child: const Image(
                    image: AssetImage('image/virus.png'),
                  )),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _contoller.value * 2.0 * math.pi,
                  child: child,
                );
              }),
          SizedBox(height: height / 100),
          const Align(
            alignment: Alignment.center,
            child: Text('Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                )),
          )
        ],
      )),
    );
  }
}
