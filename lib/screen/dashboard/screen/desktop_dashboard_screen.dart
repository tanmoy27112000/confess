import 'package:confess/screen/dashboard/dashboard_bloc/dashboard_bloc.dart';
import 'package:confess/screen/dashboard/widget/molecule/confess_widget.dart';
import 'package:confess/screen/dashboard/widget/molecule/navbar.dart';
import 'package:confess/screen/dashboard/widget/organism/dashboard_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DesktopDashboardScreen extends StatefulWidget {
  const DesktopDashboardScreen({super.key});
  //route name
  static const String routeName = '/dashboard';

  @override
  State<DesktopDashboardScreen> createState() => _DesktopDashboardScreenState();
}

class _DesktopDashboardScreenState extends State<DesktopDashboardScreen> {
  late DashboardBloc dashboardBloc;
  @override
  void initState() {
    dashboardBloc = context.read<DashboardBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: ScrollController()..addListener(focus.unfocus),
        children: [
          const Navbar(),
          const DashboardBanner(),
          const SizedBox(height: 20),
          BlocBuilder<DashboardBloc, DashboardState>(
            bloc: dashboardBloc,
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                loaded: (confessionList) => Center(
                  child: ResponsiveGridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: confessionList.length,
                    gridDelegate: const ResponsiveGridDelegate(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 10,
                      childAspectRatio: 16 / 12,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) =>
                        ConfessWidget(confession: confessionList[index]),
                  ),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
