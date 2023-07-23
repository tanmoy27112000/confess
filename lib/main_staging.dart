import 'package:confess/app/app.dart';
import 'package:confess/bootstrap.dart';
import 'package:confess/constant/contant.dart';
import 'package:confess/model/secret_model/secret_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  secretModel = SecretModel.fromJson(dotenv.env);
  setPathUrlStrategy();
  await bootstrap(() => const App());
}
