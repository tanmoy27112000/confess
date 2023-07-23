import 'package:confess/helper/database_helper.dart';
import 'package:confess/screen/dashboard/dashboard_bloc/dashboard_bloc.dart';
import 'package:confess/screen/dashboard/screen/desktop_dashboard_screen.dart';
import 'package:confess/screen/dashboard/screen/mobile_dashboard_screen.dart';
import 'package:confess/screen/dashboard/screen/tab_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  //route name
  static const String routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardBloc dashboardBloc;
  @override
  void initState() {
    dashboardBloc = context.read<DashboardBloc>();
    dashboardBloc.add(const DashboardEvent.getAllConfession());
    DatabaseHelper.instance.getRealtimeConfessionCount();
    super.initState();
  }

  @override
  void dispose() {
    DatabaseHelper.instance.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => const MobileDashboardScreen(),
        tablet: (BuildContext context) => const TabDashboardScreen(),
        desktop: (BuildContext context) => const DesktopDashboardScreen(),
      ),
    );
  }
}
