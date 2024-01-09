import 'package:confess/app/app.dart';
import 'package:confess/bootstrap.dart';
import 'package:confess/helper/firebase_helper.dart';

void main() async {
  await FirebaseHelper.instance.init();
  await bootstrap(() => const App());
}
