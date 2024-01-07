import 'package:confess/constant/color.dart';
import 'package:confess/constant/date_formatter.dart';
import 'package:confess/gen/assets.gen.dart';
import 'package:confess/model/confession_model/confession_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

// class ConfessWidget extends StatelessWidget {
//   const ConfessWidget({
//     required this.confession,
//     super.key,
//   });
//
//   final ConfessionModel confession;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       height: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             Expanded(
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: const Color(0xffEEF0FB),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                         confession.confession,
//                         style: TextStyle(
//                           fontSize: ResponsiveBreakpoints.of(context).isMobile
//                               ? 18
//                               : 10,
//                           color: Kcolor.purple,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     //create a rich text widget with tags having different color
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                       child: RichText(
//                         text: TextSpan(
//                           children: confession.tags
//                               .map(
//                                 (e) => TextSpan(
//                                   text: '#$e ',
//                                   style: TextStyle(
//                                     fontFamily:
//                                         GoogleFonts.poppins().fontFamily,
//                                     color: generateColorFromString(e),
//                                     fontSize: ResponsiveBreakpoints.of(context)
//                                             .isMobile
//                                         ? 16
//                                         : 10,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                         child: Text(
//                           ' - ${confession.age} | ${confession.gender == 0 ? 'Male' : 'Female'}',
//                           style: TextStyle(
//                             fontSize: ResponsiveBreakpoints.of(context).isMobile
//                                 ? 16
//                                 : 10,
//                             color: Kcolor.violet,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 5),
//             //like icon
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   radius: 10,
//                   backgroundColor: confession.gender == 0
//                       ? Colors.blue.shade300
//                       : const Color(0xffFF6AC3),
//                   child: Assets.icons.anonymous.image(width: 15),
//                 ),
//                 const SizedBox(width: 5),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       KdateFormatter.ddMMMyyyy.format(
//                         DateTime.parse(confession.createdAt.toString()),
//                       ),
//                       style: TextStyle(
//                         fontSize: ResponsiveBreakpoints.of(context).isMobile
//                             ? 16
//                             : 10,
//                         fontWeight: FontWeight.bold,
//                         color: Kcolor.violet,
//                       ),
//                     ),
//                     Text(
//                       KdateFormatter.hhmma.format(
//                         DateTime.parse(confession.createdAt.toString()),
//                       ),
//                       style: TextStyle(
//                         fontSize: ResponsiveBreakpoints.of(context).isMobile
//                             ? 16
//                             : 10,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Color generateColorFromString(String join) {
//     return Colors.primaries[join.hashCode % Colors.primaries.length];
//   }
// }

class ConfessWidget extends StatelessWidget {
  const ConfessWidget({
    required this.confession,
    super.key,
  });

  final ConfessionModel confession;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF0FB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: RichText(
                  text: TextSpan(
                    text: '${confession.confession}\n\n',
                    style: TextStyle(
                      fontSize:
                          ResponsiveBreakpoints.of(context).isMobile ? 18 : 10,
                      color: Kcolor.purple,
                      fontWeight: FontWeight.bold,
                    ),
                    children: confession.tags
                        .map(
                          (c) => TextSpan(
                            text: '#$c ',
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: generateColorFromString(c),
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isMobile
                                      ? 16
                                      : 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        .toList()
                      ..add(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '- ${confession.age} | ${confession.gender == 0 ? 'Male' : 'Female'} ',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: ResponsiveBreakpoints.of(context)
                                            .isMobile
                                        ? 16
                                        : 10,
                                    color: Kcolor.violet,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: confession.gender == 0
                      ? Colors.blue.shade300
                      : const Color(0xffFF6AC3),
                  child: Assets.icons.anonymous.image(width: 15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KdateFormatter.ddMMMyyyy.format(
                        DateTime.parse(confession.createdAt.toString()),
                      ),
                      style: TextStyle(
                        fontSize: ResponsiveBreakpoints.of(context).isMobile
                            ? 16
                            : 10,
                        fontWeight: FontWeight.bold,
                        color: Kcolor.violet,
                      ),
                    ),
                    Text(
                      KdateFormatter.hhmma.format(
                        DateTime.parse(confession.createdAt.toString()),
                      ),
                      style: TextStyle(
                        fontSize: ResponsiveBreakpoints.of(context).isMobile
                            ? 16
                            : 10,
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

  Color generateColorFromString(String join) {
    return Colors.primaries[join.hashCode % Colors.primaries.length];
  }
}
