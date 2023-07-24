import 'package:confess/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';

class BtnOutline extends StatelessWidget {
  const BtnOutline({super.key, required this.title, required this.onTap});
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: HoverOver(
        builder: (isHovered) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: isHovered ? Kcolor.pink : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              border: Border.all(
                color: isHovered ? Colors.white : Kcolor.pink,
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isHovered ? Colors.white : Kcolor.pink,
              ),
            ),
          );
        },
      ),
    );
  }
}
