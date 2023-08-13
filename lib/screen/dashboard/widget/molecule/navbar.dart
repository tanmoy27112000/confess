// ignore_for_file: inference_failure_on_instance_creation

import 'package:confess/constant/color.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:searchfield/searchfield.dart';
import 'package:substring_highlight/substring_highlight.dart';

final focus = FocusNode();

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  TextEditingController controller = TextEditingController();

  List<String> companyList = [
    'Fortmindz Global Services Pvt Ltd ',
    'Mindtree Limited',
    'Tata Consultancy Services Limited',
    'Wipro Limited',
    'Accenture',
    'Cognizant Technology Solutions',
    'Capgemini',
    'Infosys Limited',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(9, 0, 0, 0),
            blurRadius: 231,
            offset: Offset(0, 10),
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: 55,
        borderRadius: 12,
        blur: 20,
        alignment: Alignment.center,
        border: 3,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color(0xFFFFFFFF).withOpacity(0.5),
          ],
        ),
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Kcolor.darkPink.withOpacity(0.2),
            Kcolor.darkblue.withOpacity(0.2),
          ],
          stops: const [0.1, 1],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 5),
              CircleAvatar(
                radius: 12,
                backgroundColor: Kcolor.white,
                child: const Text(
                  '🔥',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Confess.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'TP Hero',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'me',
                      style: TextStyle(
                        color: Kcolor.darkblue,
                        fontFamily: 'TP Hero',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
              if (!ResponsiveBreakpoints.of(context).isMobile)
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(12, 0, 0, 0),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 320,
                          height: 35,
                          child: SearchField(
                            suggestions: const [],
                            searchStyle: const TextStyle(
                              fontSize: 12,
                            ),
                            controller: controller,
                            offset: const Offset(-5, 38),
                            maxSuggestionsInViewPort: 10,
                            onSearchTextChanged: (p0) {
                              return p0.length >= 3
                                  ? companyList
                                      .where(
                                        (element) => element
                                            .toLowerCase()
                                            .contains(p0.toLowerCase()),
                                      )
                                      .toList()
                                      .map(
                                        (e) => SearchFieldListItem(
                                          e,
                                          child: ListTile(
                                            minLeadingWidth: 0,
                                            minVerticalPadding: 5,
                                            iconColor: Kcolor.grey,
                                            leading: Icon(
                                              Icons.search,
                                              color: Kcolor.grey,
                                              size: 12,
                                            ),
                                            title: SubstringHighlight(
                                              textStyleHighlight: TextStyle(
                                                fontSize: 10,
                                                color: Kcolor.darkPink,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: 10,
                                                color: Kcolor.grey,
                                              ),
                                              text: e,
                                              term: controller.text,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : null;
                            },
                            suggestionsDecoration: SuggestionDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 12,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            suggestionItemDecoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0),
                                  width: 0,
                                ),
                              ),
                            ),
                            searchInputDecoration: InputDecoration(
                              hintText: 'Search confession',
                              hintStyle: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF535353),
                              ),
                              contentPadding: const EdgeInsets.only(bottom: 2),
                              prefixIcon: ImageIcon(
                                const AssetImage(
                                  'assets/icons/search_icon.png',
                                ),
                                size: 20,
                                color: Kcolor.darkblue,
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 30,
                              ),
                              border: InputBorder.none,
                            ),
                            key: const Key('searchfield'),
                            textInputAction: TextInputAction.search,
                            focusNode: focus,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (!ResponsiveBreakpoints.of(context).isMobile) const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 5,
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
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/icons/profile.png'),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Kcolor.black,
                        fontFamily: 'TP Hero',
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 5),
                    ImageIcon(
                      const AssetImage('assets/icons/arrow_down.png'),
                      color: Kcolor.black,
                      size: 6,
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              )

              // HoverOver(
              //   builder: (isHovered) {
              //     return InkWell(
              //       onTap: () {
              //         AuthHelper.instance.login();
              //       },
              //       child: AnimatedContainer(
              //         duration: const Duration(milliseconds: 300),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 20,
              //           vertical: 5,
              //         ),
              //         decoration: BoxDecoration(
              //           color: isHovered ? Colors.white : Kcolor.pink,
              //           borderRadius: const BorderRadius.all(
              //             Radius.circular(100),
              //           ),
              //           border: Border.all(
              //             color: isHovered ? Kcolor.pink : Colors.white,
              //           ),
              //         ),
              //         child: Text(
              //           'Login',
              //           style: TextStyle(
              //             color: isHovered ? Kcolor.pink : Colors.white,
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
