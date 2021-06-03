import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'cors/app.dart';
import 'cors/app_state_container.dart';

void main() {
  // sharedPrefInit();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new AppStateContainer(
    child: new AppRootWidget(),
  ));
}
