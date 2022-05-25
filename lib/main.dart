import 'package:flutter/material.dart';
import 'package:world_app/Pages/Desktop/web.dart';
import 'package:world_app/Pages/home.dart';
import 'package:world_app/Pages/loading.dart';
import 'package:world_app/Pages/location.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:world_app/config.dart';
import 'package:world_app/layout.dart';
// import 'package:msix/msix.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      initialRoute: '/home',
      // home: Loading(),
      routes: {
        '/home': (context) => const Layout(
              desktop: WebVersion(),
              native: Loading(),
            ),
        // '/page': (context) => const Home(),
        '/location': (context) => const Location(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
