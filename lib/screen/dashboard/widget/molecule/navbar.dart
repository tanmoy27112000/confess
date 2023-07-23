import 'package:confess/constant/color.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 3,
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 2,
                ),
                ValueListenableBuilder<int>(
                  valueListenable: DatabaseHelper.instance.confessionList,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Text(
                      '  $value',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    );
                  },
                ),
              ],
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
                  'Login',
                  style: TextStyle(
                    color: isHovered ? Kcolor.pink : Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
