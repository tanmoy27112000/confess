import 'package:confess/screen/dashboard/widget/atom/btn_filled_atom.dart';
import 'package:confess/screen/dashboard/widget/atom/btn_outline_atom.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

Future<dynamic> addConfessDialogbox(BuildContext context) {
  final gender = <String>['male', 'female'];
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
                const Spacer(),
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
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: const Text('Add Confession'),
            content: SizedBox(
              width: 450,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  )
                ],
              ),
            ),
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            actions: [
              BtnOutline(
                title: 'Cancel',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              BtnFilled(
                title: 'Add',
                onTap: () {},
              )
            ],
          ),
        );
}
