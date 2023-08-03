// ignore_for_file: inference_failure_on_instance_creation

import 'package:confess/constant/color.dart';
import 'package:confess/helper/auth_helper.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:searchfield/searchfield.dart';

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
          if (!ResponsiveBreakpoints.of(context).isMobile)
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: SearchField(
                        searchStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        suggestionState: Suggestion.hidden,
                        controller: controller,
                        offset: const Offset(0, 43),
                        maxSuggestionsInViewPort: 10,
                        suggestionsDecoration: SuggestionDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
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
                        hint: 'Search company, job title, or keywords',
                        searchInputDecoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 5, top: 11),
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Kcolor.black,
                            size: 20,
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(120, 29, 14, 98),
                          ),
                          border: InputBorder.none,
                        ),
                        key: const Key('searchfield'),
                        suggestions: [
                          'Fortmindz Global Services Pvt Ltd ',
                          'Mindtree Limited',
                          'Tata Consultancy Services Limited',
                          'Wipro Limited',
                          'Accenture',
                          'Cognizant Technology Solutions',
                          'Capgemini',
                          'Infosys Limited',
                        ]
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
                                  title: Text(
                                    e,
                                    style: TextStyle(
                                      color: Kcolor.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        focusNode: focus,
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(8),
                    //   decoration: const BoxDecoration(
                    //     color: Color(0xff1E0E62),
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(100),
                    //     ),
                    //   ),
                    //   child: const Icon(
                    //     Icons.search,
                    //     color: Colors.white,
                    //     size: 15,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          if (!ResponsiveBreakpoints.of(context).isMobile) const Spacer(),
          HoverOver(
            builder: (isHovered) {
              return InkWell(
                onTap: () {
                  AuthHelper.instance.login();
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
          ),
        ],
      ),
    );
  }
}
