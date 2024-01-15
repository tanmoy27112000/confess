// ignore_for_file: use_build_context_synchronously, cascade_invocations

import 'package:confess/constant/color.dart';
import 'package:confess/constant/snackbar.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:confess/helper/prefs_helper.dart';
import 'package:confess/routes/router.dart';
import 'package:confess/screen/dashboard/dashboard_bloc/dashboard_bloc.dart';
import 'package:confess/screen/dashboard/widget/atom/btn_filled_atom.dart';
import 'package:confess/screen/dashboard/widget/atom/btn_outlined_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:simple_chips_input/simple_chips_input.dart';

Future<dynamic> addConfessDialogbox() {
  final nameController = TextEditingController()..text = PrefsHelper.instance.userData?.displayName ?? '';
  final confessionController = TextEditingController();
  final ageController = TextEditingController();

  //form key
  final formKey = GlobalKey<FormState>();

  final gender = <String>['Male', 'Female'];
  final selectedGender = ValueNotifier<String>('');

  return ResponsiveBreakpoints.of(
    navigatorKey.currentState!.context,
  ).isMobile
      ? showModalBottomSheet(
          isScrollControlled: true,
          context: navigatorKey.currentState!.context,
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
                      title: const Text(
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
                    nameField(nameController),
                    const SizedBox(height: 20),
                    confessionField(confessionController),
                    const SizedBox(height: 20),
                    ageField(ageController),
                    const SizedBox(height: 20),
                    tagField(
                      ageController,
                      formKey: formKey,
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Kcolor.black,
                          ),
                        ),
                        Text(
                          ' (Optional)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Kcolor.darkblue,
                          ),
                        ),
                      ],
                    ),
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
                                    selectedGender.value = value ?? 'Male';
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
                              final dashboardBloc = navigatorKey.currentContext!.read<DashboardBloc>();
                              formKey.currentState!.save();
                              Ksnackbar.instance.showLoading(
                                title: 'Adding your confession...',
                              );
                              router.pop(navigatorKey.currentContext);
                              await DatabaseHelper.instance.addConfession(
                                text: confessionController.text,
                                gender: selectedGender.value == 'Male' ? 0 : 1,
                                age: ageController.text,
                                name: nameController.text,
                                uid: PrefsHelper.instance.userData?.uid ?? '',
                                tags: dashboardBloc.tags,
                              );

                              dashboardBloc.add(
                                const DashboardEvent.getLatestConfession(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      : showDialog(
          barrierColor: const Color.fromRGBO(0, 0, 0, 0.66),
          context: navigatorKey.currentState!.context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
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
                          child: Image.asset('assets/images/rectangle_shap.png'),
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
                                  const Text(
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
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Color.fromRGBO(
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
                                          SizedBox(width: 4),
                                          Text(
                                            'Close',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Kcolor.black,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    nameField(nameController),
                                    const SizedBox(height: 20),
                                    confessionField(confessionController),
                                    const SizedBox(height: 20),
                                    ageField(ageController),
                                    const SizedBox(height: 22),
                                    tagField(
                                      ageController,
                                      formKey: formKey,
                                    ),
                                    const SizedBox(height: 22),
                                    const Row(
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
                                                    selectedGender.value = gender[0];
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                      7,
                                                    ),
                                                    color: selectedGender.value == gender[0]
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
                                                        color: selectedGender.value == gender[0] ? Kcolor.white : Kcolor.darkblue,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
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
                                                    selectedGender.value = gender[1];
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                      7,
                                                    ),
                                                    color: selectedGender.value == gender[1]
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
                                                        color: selectedGender.value == gender[1] ? Kcolor.white : Kcolor.darkblue,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
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
                                      router.pop(
                                        navigatorKey.currentContext,
                                      );
                                      final dashboardBloc = navigatorKey.currentContext!.read<DashboardBloc>();
                                      formKey.currentState!.save();
                                      await DatabaseHelper.instance.addConfession(
                                        text: confessionController.text,
                                        gender: selectedGender.value == 'Male' ? 0 : 1,
                                        name: nameController.text,
                                        age: ageController.text,
                                        uid: PrefsHelper.instance.userData?.uid ?? '',
                                        tags: dashboardBloc.tags,
                                      );

                                      dashboardBloc.add(
                                        const DashboardEvent.getLatestConfession(),
                                      );
                                    },
                                    child: const Text(
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

Column tagField(
  TextEditingController ageController, {
  required GlobalKey<FormState> formKey,
}) {
  return Column(
    children: <Widget>[
      const Row(
        children: [
          Text(
            'Tags i.e (Love, Office romance, etc)',
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
      SimpleChipsInputWidget(formKey: formKey),
    ],
  );
}

Column ageField(TextEditingController ageController) {
  return Column(
    children: <Widget>[
      const Row(
        children: [
          Text(
            'Age (in number) ',
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
        controller: ageController,
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
          fillColor: Color.fromRGBO(180, 198, 241, 0.37),
          filled: true,
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}

Column confessionField(TextEditingController confessionController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
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
        minLines: 4,
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
          fillColor: Color.fromRGBO(180, 198, 241, 0.37),
          filled: true,
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}

Column nameField(TextEditingController nameController) {
  return Column(
    children: <Widget>[
      const Row(
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
          fillColor: Color.fromRGBO(180, 198, 241, 0.37),
          filled: true,
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}

class SimpleChipsInputWidget extends StatefulWidget {
  const SimpleChipsInputWidget({
    required this.formKey,
    super.key,
  });
  final GlobalKey<FormState> formKey;

  @override
  State<SimpleChipsInputWidget> createState() => _SimpleChipsInputWidgetState();
}

class _SimpleChipsInputWidgetState extends State<SimpleChipsInputWidget> {
  final FocusNode focusNode = FocusNode();
  final TextFormFieldStyle style = const TextFormFieldStyle(
    keyboardType: TextInputType.phone,
    cursorColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SimpleChipsInput(
            separatorCharacter: ',',
            focusNode: focusNode,
            formKey: widget.formKey,
            textFormFieldStyle: style,
            onChipDeleted: (p0, p1) {},
            onSaved: (p0) {
              final dashboardBloc = navigatorKey.currentContext!.read<DashboardBloc>();
              dashboardBloc.tags = p0.split(',').where((element) => element.isNotEmpty).toList();
            },
            chipTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            deleteIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.delete,
                size: 14,
                color: Colors.white,
              ),
            ),
            widgetContainerDecoration: BoxDecoration(
              color: const Color.fromRGBO(180, 198, 241, 0.37),
              borderRadius: BorderRadius.circular(5),
            ),
            chipContainerDecoration: BoxDecoration(
              color: Kcolor.darkblue,
              border: Border.all(),
              borderRadius: BorderRadius.circular(50),
            ),
            placeChipsSectionAbove: false,
          ),
        ),
      ],
    );
  }
}
