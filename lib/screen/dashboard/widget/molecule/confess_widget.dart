import 'package:appwrite/models.dart';
import 'package:confess/constant/color.dart';
import 'package:confess/constant/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ConfessWidget extends StatelessWidget {
  const ConfessWidget({
    required this.confession,
    super.key,
  });

  final Document confession;

  @override
  Widget build(BuildContext context) {
    return HoverOver(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 200,
        decoration: BoxDecoration(
          color: isHovered ? Kcolor.pink : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                confession.data['confession'] as String,
                style: TextStyle(
                  fontSize:
                      ResponsiveBreakpoints.of(context).isMobile ? 18 : 10,
                  color: isHovered ? Colors.white : Kcolor.purple,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  KdateFormatter.ddMMMyyy.format(
                    DateTime.parse(confession.data['createdOn'] as String),
                  ),
                  style: TextStyle(
                    fontSize:
                        ResponsiveBreakpoints.of(context).isMobile ? 16 : 10,
                    fontWeight: FontWeight.bold,
                    color: isHovered ? Colors.white : Kcolor.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
