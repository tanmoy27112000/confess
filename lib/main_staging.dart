import 'package:confess/app/app.dart';
import 'package:confess/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setPathUrlStrategy();
  await bootstrap(() => const App());
}
