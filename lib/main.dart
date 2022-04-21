import 'package:flutter/material.dart';
import 'Views/ElFawasel.dart';
import 'Views/table_of_contents.dart';
import 'Views/search.dart';
import 'Views/pages.dart';
import 'Views/side_drawer.dart';
import 'Views/ElFasel.dart';
import 'Views/ElFawasel.dart';
import 'Views/ElKhawater.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyApp(),
        '/table_of_contents': (context) =>const TableOf(),
        '/el_fawasel': (context) =>const ElFawasel(),
        '/el_khawater': (context) =>const ElKhawater(),
        '/side_drawer': (context) => sideDrawer(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/search': (context) => const Search(),
      },
    );
  }
}



