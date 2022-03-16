
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(
      const MyApp()
  );
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Table(),
    );
  }
}


class Table extends StatefulWidget {
  const Table({Key? key}) : super(key: key);

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> with SingleTickerProviderStateMixin{
  final int  _contentNumber=10;
  final int  _threshold=4;
   bool _loading=false;
   bool _conetntError = false;
  ScrollController? _scrollController;
  TabController? _tabController;


  @override
  void initState() {
    // TODO: implement initState
    _scrollController =  ScrollController(initialScrollOffset: 5.0);
    _tabController =  TabController(length:2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:const Color(0xFF94C2B6),
          // title: const Text('الفهرس'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text("الأجزاء", style: TextStyle(color: Colors.black87,  fontWeight: FontWeight.bold)),
              ),
              Tab(
                icon:  Text("السور",style:TextStyle(color: Colors.black87,  fontWeight: FontWeight.bold)),
              ),
            ],
            indicatorColor: const Color(0xFFFF1C7B7B)
          ),
          actions: <Widget> [
            Container(
              child: const Padding(
                padding:  EdgeInsets.all(16),
                child:  Text(
                  "الفهرس  ",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
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
        ),
        body:  TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
              child: const Text("الاجزاء"),
            ),
            Column(
              children: <Widget>
              [
                Container(
              height: 55,
              color:const Color(0xFF94C2B6),
              padding: const EdgeInsets.all(6),
              child:  TextFormField(
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFFFF1C7B7B),
                  ),
                  // focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
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

            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: 15,
                  shrinkWrap: true,
                  itemBuilder:
                      (BuildContext context, int index) {
                    if (index ==
                        _contentNumber -
                    _threshold) {
                      print("Reached end of list");
                      // viewUsers();
                    }
                    if (index == _contentNumber) {
                      if (_conetntError) {
                        return Expanded(
                          // height: 50,
                          // width: 100,
                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _loading = true;
                                    _conetntError = false;
                                     print("Error");
                                    // viewUsers();
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                      "Error while loading photos, tap to try again"),
                                ),
                              )),
                        );
                      } else {}
                    }
                    return buildListTile(1);
                  }),
            ),
              ],
            ),
            // Center(
            //   child: Text("It's sunny here"),
            // ),
          ],
        ),
      ),
    );
  }
}

ListTile buildListTile(int number) {
  return ListTile(
    onTap: (){
      print("Tapped");
    },
    title: Text('السورة', textAlign: TextAlign.right, style: TextStyle( fontWeight: FontWeight.bold)),
    trailing: Icon(Icons.api_rounded,color:const Color(0xFFFF1C7B7B) ),
  );
}

