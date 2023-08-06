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

Future<dynamic> addConfessDialogbox() {
  final nameController = TextEditingController();
  final confessionController = TextEditingController();
  final companyNameController = TextEditingController();

  final gender = <String>['Male', 'Female'];
  final selectedGender = ValueNotifier<String>('');

  return ResponsiveBreakpoints.of(
              alice.getNavigatorKey()!.currentState!.context)
          .isMobile
      ? showModalBottomSheet(
          isScrollControlled: true,
          context: alice.getNavigatorKey()!.currentState!.context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Add Confession',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Kcolor.pink,
                        ),
                      ),
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
                    const Text('Your gender (OPTIONAL)'),
                    const SizedBox(height: 20),
                    ValueListenableBuilder<String>(
                      valueListenable: selectedGender,
                      builder: (
                        BuildContext context,
                        String value,
                        Widget? child,
                      ) {
                        return Column(
                          children: [
                            ...List.generate(
                              gender.length,
                              (index) => RadioListTile(
                                title: Text(gender[index]),
                                value: gender[index],
                                groupValue: value,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender.value = value ?? 'male';
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      },
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
                            onTap: () async {
                              Ksnackbar.instance.showLoading(
                                title: 'Adding your confession...',
                              );
                              await DatabaseHelper.instance.addConfession(
                                text: confessionController.text,
                                gender: selectedGender.value,
                              );
                              router
                                  .pop(alice.getNavigatorKey()!.currentContext);
                              // ignore: use_build_context_synchronously
                              final dashboardBloc = alice
                                  .getNavigatorKey()!
                                  .currentContext!
                                  .read<DashboardBloc>();
                              // ignore: cascade_invocations
                              dashboardBloc.add(
                                const DashboardEvent.getLatestConfession(),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      : showDialog(
          barrierColor: const Color.fromRGBO(0, 0, 0, 0.66),
          context: alice.getNavigatorKey()!.currentState!.context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                content: SizedBox(
                  width: 450,
                  height: 848,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child:
                              Image.asset('assets/images/rectangle_shap.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Add Confession',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Kcolor.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Kcolor.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor:
                                                const Color.fromRGBO(
                                              180,
                                              198,
                                              241,
                                              0.37,
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: Kcolor.darkblue,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Close',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Kcolor.black,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: 30,
                                  top: 20,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 250,
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Name ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Kcolor.black,
                                          ),
                                        ),
                                        Text(
                                          '(Optional)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Kcolor.darkblue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                              180,
                                              198,
                                              241,
                                              0,
                                            ),
                                          ),
                                        ),
                                        fillColor:
                                            Color.fromRGBO(180, 198, 241, 0.37),
                                        filled: true,
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Your Confession',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Kcolor.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: confessionController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      minLines: 6,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                              180,
                                              198,
                                              241,
                                              0,
                                            ),
                                          ),
                                        ),
                                        fillColor:
                                            Color.fromRGBO(180, 198, 241, 0.37),
                                        filled: true,
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          'Company Name ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Kcolor.black,
                                          ),
                                        ),
                                        Text(
                                          '(Optional)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Kcolor.darkblue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: companyNameController,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                              180,
                                              198,
                                              241,
                                              0,
                                            ),
                                          ),
                                        ),
                                        fillColor:
                                            Color.fromRGBO(180, 198, 241, 0.37),
                                        filled: true,
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 22),
                                    Row(
                                      children: [
                                        Text(
                                          'Your gender ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Kcolor.black,
                                          ),
                                        ),
                                        Text(
                                          '(Optional)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Kcolor.darkblue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    ValueListenableBuilder<String>(
                                      valueListenable: selectedGender,
                                      builder: (
                                        BuildContext context,
                                        String value,
                                        Widget? child,
                                      ) {
                                        return Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedGender.value =
                                                        gender[0];
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      7,
                                                    ),
                                                    color: selectedGender
                                                                .value ==
                                                            gender[0]
                                                        ? Kcolor.darkblue
                                                        : const Color.fromRGBO(
                                                            180,
                                                            198,
                                                            241,
                                                            0.37,
                                                          ),
                                                  ),
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      gender[0],
                                                      style: TextStyle(
                                                        color: selectedGender
                                                                    .value ==
                                                                gender[0]
                                                            ? Kcolor.white
                                                            : Kcolor.darkblue,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedGender.value =
                                                        gender[1];
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      7,
                                                    ),
                                                    color: selectedGender
                                                                .value ==
                                                            gender[1]
                                                        ? Kcolor.darkblue
                                                        : const Color.fromRGBO(
                                                            180,
                                                            198,
                                                            241,
                                                            0.37,
                                                          ),
                                                  ),
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      gender[1],
                                                      style: TextStyle(
                                                        color: selectedGender
                                                                    .value ==
                                                                gender[1]
                                                            ? Kcolor.white
                                                            : Kcolor.darkblue,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 23),
                              Align(
                                child: SizedBox(
                                  width: 201,
                                  height: 65,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Kcolor.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Ksnackbar.instance.showLoading(
                                        title: 'Adding your confession...',
                                      );
                                      await DatabaseHelper.instance
                                          .addConfession(
                                        text: confessionController.text,
                                        gender: selectedGender.value,
                                      );
                                      router.pop(
                                        alice.getNavigatorKey()!.currentContext,
                                      );
                                      // ignore: use_build_context_synchronously
                                      final dashboardBloc = alice
                                          .getNavigatorKey()!
                                          .currentContext!
                                          .read<DashboardBloc>();
                                      // ignore: cascade_invocations
                                      dashboardBloc.add(
                                        const DashboardEvent
                                            .getLatestConfession(),
                                      );
                                    },
                                    child: Text(
                                      'Add Confessions',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Kcolor.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
}
