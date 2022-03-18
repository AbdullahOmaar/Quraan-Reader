import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;


Future<List<List>> loadCsvData(String path) async {

  final file2=await rootBundle.loadString(path);
  List<List<dynamic>> csvTable = CsvToListConverter().convert(file2);
  // print(file2);
  return csvTable;

}


Future<List<Map<String, dynamic>>> getData() async
{
  String path="./assets/highlights.csv";
  List<List<dynamic>> data=await loadCsvData(path);

  return loadAyaTable(data);

  // print(data.length);

}

Future<List<Map<String, dynamic>>> loadAyaTable(List<List<dynamic>> data) async
{


  int aya_id=1;

  List<dynamic> coordinates_aya=[];

  List<List<dynamic>> aya_details=[];

  List<Map<String, dynamic>> load_aya=[];

  int last_surah=data[1][7];

  int i=1;

  while (i<data.length)
  {
    int current_surah=data[1][7];



    String coord="";
    int last_aya=data[i][6];
    coord=coord+data[i][0].toString()+","+data[i][1].toString()+","+data[i][2].toString()+","+data[i][3].toString()+",";

    int inc_ind=1;

    for (int j=i+1;j<data.length;j++)
    {
      int current_aya=data[j][6];
      if (last_surah==current_surah && last_aya==current_aya)
      {
        inc_ind++;
        coord=coord+data[j][0].toString()+","+data[j][1].toString()+","+data[j][2].toString()+","+data[j][3].toString()+",";
      }
      else{
        break;
      }
    }
    i=i+inc_ind;

    // print(aya_id);

    load_aya.add({"id": aya_id,

      "aya_number":last_aya,
      "aya_coordinates": coord,
    });

    aya_details.add([aya_id,coord,last_aya]);

    aya_id++;

    coordinates_aya.add(coord);

  }

  // print(load_aya.length);
  // //
  // for (int k=0;k<load_aya.length;k++)
  // {
  //   print(load_aya[k]);
  // }

  return load_aya;

}

