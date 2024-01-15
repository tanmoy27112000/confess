import 'package:confess/constant/color.dart';
import 'package:confess/helper/debouncer.dart';
import 'package:confess/screen/dashboard/navbar_bloc/navbar_bloc.dart';
import 'package:confess/screen/dashboard/widget/molecule/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:substring_highlight/substring_highlight.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  TextEditingController controller = TextEditingController();

  Debouncer debouncer = Debouncer();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          return SearchField(
            suggestions: state is NavbarLoadingState
                ? [
                    SearchFieldListItem(
                      'loading',
                      key: const ValueKey('loading'),
                      item: 'loading',
                      child: Transform.scale(
                        scale: 0.6,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 3),
                        ),
                      ),
                    ),
                  ]
                : state is! NavbarLoadedState
                    ? []
                    : state.tagList
                        .map(
                          (e) => SearchFieldListItem(
                            e.tagName,
                            key: ValueKey(e),
                            item: e,
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 0,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                              visualDensity: VisualDensity.compact,
                              iconColor: Kcolor.grey,
                              leading: const Icon(
                                Icons.search,
                                color: Kcolor.grey,
                                size: 12,
                              ),
                              title: SubstringHighlight(
                                textStyleHighlight: const TextStyle(
                                  fontSize: 10,
                                  color: Kcolor.darkPink,
                                  fontWeight: FontWeight.w800,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 10,
                                  color: Kcolor.grey,
                                ),
                                text: e.tagName,
                                term: controller.text,
                              ),
                            ),
                          ),
                        )
                        .toList(),
            searchStyle: const TextStyle(fontSize: 12),
            controller: controller,
            offset: const Offset(0, 50),
            maxSuggestionsInViewPort: 10,
            onSearchTextChanged: (value) {
              if (value.trim().length < 3) {
                debouncer.cancel();
                context.read<NavbarBloc>().add(const NavbarEvent.started());
                return null;
              }
              debouncer.run(() {
                context.read<NavbarBloc>().add(NavbarEvent.getTags(query: value));
              });
              return null;
            },
            suggestionsDecoration: SuggestionDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            hint: 'Search company, job title, or keywords',
            searchInputDecoration: InputDecoration(
              fillColor: Kcolor.white,
              filled: true,
              isDense: true,
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Kcolor.darkblue,
                size: 20,
              ),
              hintStyle: const TextStyle(
                fontSize: 12,
                color: Kcolor.grey,
              ),
              enabledBorder: _inputBorder(),
              border: _inputBorder(),
              focusedBorder: _inputBorder(),
            ),
            key: const Key('searchfield'),
            textInputAction: TextInputAction.search,
            focusNode: focus,
          );
        },
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
