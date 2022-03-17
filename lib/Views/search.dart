import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Search(),
    );
  }
}


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}


class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor:const Color(0xFF94C2B6),
          actions: <Widget> [
               Container(
                 child: const Padding(
                   padding:  EdgeInsets.all(16),
                   child:  Text(
                       "البحث  ",
                       style: TextStyle(
                           color: Colors.black87,
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                       )
                   ),
                 ),
                ),
            IconButton(
            icon: const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.black),
            //TODO: Navigate to previous page
            onPressed: () => Navigator.of(context).pop(),
          ),
          ],
          centerTitle: true,
        ),
          body: Container(
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
                color: const Color(0xFF94C2B6)
            ),
              child:  Center(
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration:const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: InputBorder.none,
                      hintText: 'بحث',
                  ),
                    onChanged: (keywords) {
                      setState (() {
                        //TODO: Retrieve results
                      });
                    },
                ),
              ),
          ),
      );
  }
}
