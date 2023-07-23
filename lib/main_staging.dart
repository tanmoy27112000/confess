import 'package:confess/app/app.dart';
import 'package:confess/bootstrap.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  bootstrap(() => const App());
}
