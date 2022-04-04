import 'package:flutter/material.dart';
import 'ElKhawater.dart';
import 'ElFasel.dart';
import 'favourites.dart';
import '../View_Model/create_db.dart';

import '../View_Model/create_db.dart';
import '../Services.dart';

import '../Models/Aya.dart';

import 'package:quraan_reader/Models/Utilities.dart';

import 'package:csv/csv.dart';
import 'dart:io';
import 'dart:convert';


class ElFawasel extends StatefulWidget {
  const ElFawasel({Key? key}) : super(key: key);

  @override
  State<ElFawasel> createState() => _ElFawaselState();
}

class _ElFawaselState extends State<ElFawasel> {


  Future<void> readData()
  async {

    print("Before read al aya");
    var out=await DBHelper.instance.readAllAya();

    print(out);

    List<Aya> AyaList=convertToModel(out!);
    // print("after converting to model");
  // print("Hi");
    // print(AyaList[3215].ayaText);


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBHelper.instance.database;
    readData();


  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(

          actions: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: [
                    const Text(
                      "الفواصل",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),

             

              ],
            ),

          ],
          backgroundColor: Color(0xFF2c9494),
          bottom: const TabBar(
            unselectedLabelColor: Colors.black,
            tabs: [
              Text("المفضلة",
              style: TextStyle(
                fontSize: 20
              ),
              ),
              Text("الفاصل",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              Text("الخواطر",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ],


          ),

        ),
        body: TabBarView(
          children: [
            buildPage('1'),
            buildPage('2'),
            buildPage('3'),
          ],
        ),
      ),

    );


  }
}
Widget buildPage(String text) {

  if (text=="1")
    {
      return Favourites();
    }
  else if(text=="2"){
    return ElFasel();
  }
  else{
    return ElKhawater();
  }

  }
