import 'package:confess/app/app.dart';
import 'package:confess/bootstrap.dart';
import 'package:confess/helper/firebase_helper.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await FirebaseHelper.instance.init();
  setPathUrlStrategy();
  await bootstrap(() => const App());
}
