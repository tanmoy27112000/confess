import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:confess/app/view/app.dart';
import 'package:confess/constant/color.dart';
import 'package:flutter/material.dart';

class Ksnackbar {
  Ksnackbar._privateConstructor();
  static final Ksnackbar _instance = Ksnackbar._privateConstructor();
  static Ksnackbar get instance => _instance;

  void showNewConfession({required String title}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 5),
      content: AwesomeSnackbarContent(
        color: Kcolor.pink,
        title: 'New Confession alert!',
        message: title,
        contentType: ContentType.success,
        inMaterialBanner: true,
      ),
    );

    ScaffoldMessenger.of(alice.getNavigatorKey()!.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
