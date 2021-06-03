import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';

import '../cors/app_state_container.dart';
import '../model/app_state.dart';
import 'auth/auth_screen.dart';
import 'home/home.dart';

class IndexScreen extends StatefulWidget {
  @override
  IndexScreenState createState() => new IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  late AppState appState;

  Widget get _pageToDisplay {
    if (appState.isLoading) {
      return _loadingView;
    } else if (!appState.isLoading && appState.isLoggedIn == false) {
      return new AuthScreen();
    } else {
      return _homeView;
    }
    // else {
    //   return _homeView;
    // }
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget get _homeView {
    return Home();
  }

  @override
  Widget build(BuildContext context) {
    var container = AppStateContainer.of(context);
    appState = container.state;
    Widget body = _pageToDisplay;
    if (appState.isLoggedIn == true) {
      return body;
    } else {
      return new Scaffold(
        body: body,
      );
    }
  }
}
