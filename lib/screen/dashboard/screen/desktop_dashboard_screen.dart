import 'package:confess/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';

class DesktopDashboardScreen extends StatefulWidget {
  const DesktopDashboardScreen({super.key});
  //route name
  static const String routeName = '/dashboard';

  @override
  State<DesktopDashboardScreen> createState() => _DesktopDashboardScreenState();
}

class _DesktopDashboardScreenState extends State<DesktopDashboardScreen> {
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
                HoverOver(
                  builder: (isHovered) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: isHovered ? Colors.white : Kcolor.pink,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(
                          color: isHovered ? Kcolor.pink : Colors.white,
                        ),
                      ),
                      child: Text(
                        'Add Confession',
                        style: TextStyle(
                          color: isHovered ? Kcolor.pink : Colors.white,
                        ),
                      ),
                    );
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
        ],
      ),
    );
  }
}
