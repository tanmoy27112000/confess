import 'package:confess/constant/color.dart';
import 'package:confess/screen/dashboard/widget/atom/btn_filled_atom.dart';
import 'package:confess/screen/dashboard/widget/molecule/add_confess_dialogbox.dart';
import 'package:confess/screen/dashboard/widget/molecule/confess_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TabDashboardScreen extends StatefulWidget {
  const TabDashboardScreen({super.key});
  //route name
  static const String routeName = '/dashboard';

  @override
  State<TabDashboardScreen> createState() => _TabDashboardScreenState();
}

class _TabDashboardScreenState extends State<TabDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                const Text(
                  'Confess.life',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xff1E0E62),
                  ),
                ),
                const Spacer(),
                BtnFilled(
                  title: 'Add Confession',
                  onTap: () {
                    addConfessDialogbox(context);
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Latest confessions from around the world',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Kcolor.purple,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: 600,
                child: Text(
                  'Confess.life is a place where you can share your confessions anonymously and read confessions from other people.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Kcolor.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ResponsiveGridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              gridDelegate: const ResponsiveGridDelegate(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 20,
                childAspectRatio: 16 / 12,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => const ConfessWidget(),
            ),
          )
        ],
      ),
    );
  }
}
