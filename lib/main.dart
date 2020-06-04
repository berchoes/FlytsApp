import 'package:flight/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/home": (context) => HomePage(),
      },
    ));
