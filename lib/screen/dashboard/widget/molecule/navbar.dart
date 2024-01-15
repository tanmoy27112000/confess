import 'package:confess/constant/color.dart';
import 'package:confess/gen/assets.gen.dart';
import 'package:confess/helper/auth_helper.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:confess/helper/prefs_helper.dart';
import 'package:confess/routes/router.dart';
import 'package:confess/screen/dashboard/widget/molecule/search_bar.dart';
import 'package:confess/screen/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:responsive_framework/responsive_framework.dart';

final focus = FocusNode();

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
                ),
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
                  builder: (BuildContext context, dynamic value, Widget? child) {
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
          const AppSearchBar(),
          if (!ResponsiveBreakpoints.of(context).isMobile) const Spacer(),
          // if (false)
          // ignore: dead_code
          ValueListenableBuilder<bool>(
            valueListenable: AuthHelper.instance.isLoggedIn,
            builder: (BuildContext context, bool value, Widget? child) {
              return value
                  ? Container(
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: const Color(0xffFF6AC3),
                                  child: Assets.icons.anonymous.image(width: 15),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  PrefsHelper.instance.userData?.displayName ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    AuthHelper.instance.signOut();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.power_settings_new_rounded,
                                      size: 15,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : HoverOver(
                      builder: (isHovered) {
                        return InkWell(
                          onTap: () {
                            // AuthHelper.instance.signInWithGoogle();
                            router.push(ProfileScreen.routeName);
                          },
                          child: AnimatedContainer(
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
                          ),
                        );
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
