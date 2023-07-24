import 'package:confess/app/view/app.dart';
import 'package:confess/constant/color.dart';
import 'package:confess/constant/snackbar.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:confess/routes/router.dart';
import 'package:confess/screen/dashboard/dashboard_bloc/dashboard_bloc.dart';
import 'package:confess/screen/dashboard/widget/atom/btn_filled_atom.dart';
import 'package:confess/screen/dashboard/widget/atom/btn_outlined_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

Future<dynamic> addConfessDialogbox(BuildContext context) {
  final confessionController = TextEditingController();
  final gender = <String>['male', 'female'];
  final selectedGender = ValueNotifier<String>('');
  return ResponsiveBreakpoints.of(context).isMobile
      ? showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Add Confession'),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 6,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter your confession',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Your gender'),
                const SizedBox(height: 20),
                // add radio button for select the male or female
                ...List.generate(
                  gender.length,
                  (index) => RadioListTile(
                    title: Text(gender[index]),
                    value: gender[index],
                    groupValue: gender,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BtnOutline(
                        title: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 10),
                      BtnFilled(
                        title: 'Add',
                        onTap: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      : showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  'Add Confession',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Kcolor.pink,
                  ),
                ),
                content: SizedBox(
                  width: 450,
                  height: 320,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: confessionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 6,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: 'Enter your confession',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Your gender (OPTIONAL)'),
                      const SizedBox(height: 20),
                      // add radio button for select the male or female
                      ValueListenableBuilder<String>(
                        valueListenable: selectedGender,
                        builder: (BuildContext context, String value, Widget? child) {
                          return Column(
                            children: <Widget>[
                              ...List.generate(
                                gender.length,
                                (index) => RadioListTile<String>(
                                  title: Text(gender[index]),
                                  value: gender[index],
                                  groupValue: value,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender.value = value ?? 'male';
                                    });
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                actionsPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                actions: [
                  BtnOutline(
                    title: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  BtnFilled(
                    title: 'Add',
                    onTap: () async {
                      Ksnackbar.instance.showLoading(
                        title: 'Adding your confession...',
                      );
                      await DatabaseHelper.instance.addConfession(
                        text: confessionController.text,
                        gender: selectedGender.value,
                      );
                      router.pop(alice.getNavigatorKey()!.currentContext);
                      // ignore: use_build_context_synchronously
                      final dashboardBloc = alice.getNavigatorKey()!.currentContext!.read<DashboardBloc>();
                      // ignore: cascade_invocations
                      dashboardBloc.add(
                        const DashboardEvent.getLatestConfession(),
                      );
                    },
                  )
                ],
              );
            },
          ),
        );
}
