import 'package:flutter/material.dart';
import 'ElKhawater.dart';
import 'ElFasel.dart';
import 'favourites.dart';

import '../Services.dart';

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



  void getData() async
  {
    String path="./assets/highlights.csv";
    List<List<dynamic>> data=await loadCsvData(path);

    List<dynamic> coordinates_aya=[];

    int last_surah=data[1][7];

    int i=1;

    while (i<data.length)
      {
        int current_surah=data[1][7];

        String coord="";
        int last_aya=data[i][6];
        coord=coord+data[i][0].toString()+","+data[i][1].toString()+","+data[i][2].toString()+","+data[i][3].toString()+",";

        for (int j=i+1;j<data.length;j++)
        {
            int current_aya=data[i][6];
            if (last_surah==current_surah && last_aya==current_aya)
              {
                coord=coord+data[j][0].toString()+","+data[j][1].toString()+","+data[j][2].toString()+","+data[j][3].toString()+",";
              }
            else{
              break;
            }
        }

        coordinates_aya.add(coord);

      }

      // print(coordinates_aya.length);
      //
      // for (int k=0;k<coordinates_aya.length;k++)
      //   {
      //     print(coordinates_aya[k]);
      //   }


    // print(data.length);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
