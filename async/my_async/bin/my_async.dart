import 'dart:async';

import 'package:my_async/screens/AccountScreen.dart';

void main(List<String> arguments) async {
  AccountScreen screen = AccountScreen();

  StreamSubscription stream = screen.initializeStream();
  screen.runBot();
}