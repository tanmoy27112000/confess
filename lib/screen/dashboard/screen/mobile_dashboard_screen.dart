import 'package:flutter/material.dart';

class MobileDashboardScreen extends StatefulWidget {
  const MobileDashboardScreen({super.key});
  //route name
  static const String routeName = '/dashboard';

  @override
  State<MobileDashboardScreen> createState() => _MobileDashboardScreenState();
}

class _MobileDashboardScreenState extends State<MobileDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('mobile'),
    );
  }
}
