import 'package:app1/screeen/dasboard_screen.dart';
import 'package:app1/screeen/events_screen.dart';
import 'package:app1/screeen/login_screen.dart';
import 'package:app1/screeen/onboarding_screen.dart';
import 'package:app1/screeen/register_screen.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => RegisterScreen(),
    '/onboarding': (BuildContext context) => OnboardinsScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/events': (BuildContext context) => EventsScreen(),
    '/login': (BuildContext context) => LoginScreen(),
  };
}
