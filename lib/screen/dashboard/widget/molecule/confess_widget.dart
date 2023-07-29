import 'package:appwrite/models.dart';
import 'package:confess/constant/color.dart';
import 'package:confess/constant/date_formatter.dart';
import 'package:confess/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ConfessWidget extends StatelessWidget {
  const ConfessWidget({
    required this.confession,
    super.key,
  });

  final Document confession;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
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
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffEEF0FB),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        confession.data['confession'] as String,
                        style: TextStyle(
                          fontSize: ResponsiveBreakpoints.of(context).isMobile ? 18 : 10,
                          color: Kcolor.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: const Color(0xffFF6AC3),
                  child: Assets.icons.anonymous.image(width: 15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      KdateFormatter.ddMMMyyyy.format(
                        DateTime.parse(confession.data['createdOn'] as String),
                      ),
                      style: TextStyle(
                        fontSize: ResponsiveBreakpoints.of(context).isMobile ? 16 : 10,
                        fontWeight: FontWeight.bold,
                        color: Kcolor.violet,
                      ),
                    ),
                    Text(
                      KdateFormatter.hhmma.format(
                        DateTime.parse(confession.data['createdOn'] as String),
                      ),
                      style: TextStyle(
                        fontSize: ResponsiveBreakpoints.of(context).isMobile ? 16 : 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
