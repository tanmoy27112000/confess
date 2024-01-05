import 'package:confess/gen/assets.gen.dart';
import 'package:confess/screen/dashboard/widget/molecule/add_confess_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1632,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: Assets.images.bannerBg.image().image,
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GradientText(
                  'Latest Confessions from\naround the world.',
                  style: TextStyle(
                    fontSize: ResponsiveBreakpoints.of(context).isTablet ? 20 : 25,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: const [
                    Color(0xff3C42CF),
                    Color(0xffEFC2FF),
                  ],
                ),
                Text(
                  'Read and share confessions anonymously,\nwithout being known to any unknown. ',
                  style: TextStyle(
                    fontSize: ResponsiveBreakpoints.of(context).isTablet ? 10 : 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                HoverOver(
                  builder: (isHovered) => InkWell(
                    onTap: addConfessDialogbox,
                    child: Container(
                      width: 150,
                      height: 35,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: isHovered
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ]
                            : null,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffFF6AC3),
                            Color(0xffDB3B9B),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Add Confessions',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!ResponsiveBreakpoints.of(context).isMobile)
            Assets.images.bannerIcon.image(width: ResponsiveBreakpoints.of(context).isTablet ? 300 : 400),
        ],
      ),
    );
  }
}
