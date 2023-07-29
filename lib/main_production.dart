import 'package:confess/app/app.dart';
import 'package:confess/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  // secretModel = SecretModel.fromJson(dotenv.env);
  setPathUrlStrategy();
  await bootstrap(() => const App());
}
