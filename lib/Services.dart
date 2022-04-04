import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
// import 'dart:html';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;


Future<List<List>> loadCsvData(String path) async {

  final file2=await rootBundle.loadString(path);
  List<List<dynamic>> csvTable = CsvToListConverter().convert(file2);
  // print(file2);
  return csvTable;

}


Future<List<List>> loadAyatText(String path) async {
  final _loadedData = await rootBundle.loadString(path);
  List<List<dynamic>> ayatList=[[]];

  // List<Map<String, dynamic>> allAyat;
  // print(_loadedData.length);
  var ayat = _loadedData.split('\n');
  for (var line in ayat) {
    var aya = line.split('|');
    ayatList.add(aya);

  }
  // print(ayatList[2][0]); // Surah Number
  // print(ayatList[2][1]); // Aya Number
  // print(ayatList[2][2]); // Aya Text
   return(ayatList);

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

  var ayatList = await  loadAyatText('assets/Ayat.txt');
  ayatList.removeAt(0);
  // int aya_id=1;

  List<dynamic> coordinates_aya=[];

  List<List<dynamic>> aya_details=[];

  List<Map<String, dynamic>> load_aya=[];

  int last_surah=data[1][7];

  int i=1;
  print("DAAATAAAAA:");
  print(data.length);
  print("AYAAAAAT");
  print(ayatList.length);


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

    load_aya.add({

      "aya_number":last_aya,
      "aya_coordinates": coord,
      // "aya_text": ayatList[i]
    });

    aya_details.add([coord,last_aya]);

    // aya_id++;

    coordinates_aya.add(coord);

  }


  //
  // print("hello");
  // print(ayatList[0]);
  print("ANA ABL EL LOOP");
  print(ayatList.length);
  print(load_aya.length);

  for (int k=0;k<load_aya.length;k++)
  {

    load_aya[k]['aya_text']= ayatList[k][2];
    load_aya[k]['surah_number']= ayatList[k][0];
  }

  // String csv = const ListToCsvConverter().convert(rows);
  // new AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
  //   ..setAttribute("download", "data.csv")
  //   ..click();
  // print("dooone");


  // print(load_aya[6200]);

  return load_aya;

}




