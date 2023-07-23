import 'package:confess/constant/color.dart';
import 'package:confess/gen/assets.gen.dart';
import 'package:confess/routes/router.dart';
import 'package:confess/screen/dashboard/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  //route name
  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => router.go(DashboardScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Assets.images.cover.image(
              height: 600,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confess.life',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Kcolor.purple,
                  ),
                ),
                Lottie.network(
                  'https://lottie.host/8b598f9e-601c-45ec-9c38-ea34a10cc1fa/7dwDn8oSni.json',
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
