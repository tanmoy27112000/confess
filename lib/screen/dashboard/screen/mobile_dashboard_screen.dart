import 'package:confess/screen/dashboard/dashboard_bloc/dashboard_bloc.dart';
import 'package:confess/screen/dashboard/widget/molecule/confess_widget.dart';
import 'package:confess/screen/dashboard/widget/molecule/navbar.dart';
import 'package:confess/screen/dashboard/widget/organism/dashboard_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MobileDashboardScreen extends StatefulWidget {
  const MobileDashboardScreen({super.key});

  //route name
  static const String routeName = '/dashboard';

  @override
  State<MobileDashboardScreen> createState() => _MobileDashboardScreenState();
}

class _MobileDashboardScreenState extends State<MobileDashboardScreen> {
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
                  child: MasonryGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: confessionList.length,
                    crossAxisCount: 1,
                    itemBuilder: (context, index) => ConfessWidget(
                      confession: confessionList[index],
                    )
                        .animate(delay: const Duration(milliseconds: 400))
                        .fadeIn(duration: const Duration(milliseconds: 500))
                        .moveY(begin: 16, end: 0),
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
