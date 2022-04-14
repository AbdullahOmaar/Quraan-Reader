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

  var ayat = _loadedData.split('\n');
  for (var line in ayat) {
    var aya = line.split('|');
    ayatList.add(aya);

  }
  // print(surahsNames);
  // print(ayatList[2][1]); // Aya Number
  // print(ayatList[2][2]); // Aya Text


   return(ayatList);

}

Future<List> loadSurahsNames() async
{
  final n = await rootBundle.loadString('assets/Surahs.txt');

  var names = n.split('\n');
  List<dynamic> surahsNames=[];

  for (var line in names) {

    surahsNames.add(line);
  }
  // print(surahsNames[0]);
  return surahsNames;

}


 getData() async
{
  String path="./assets/highlights.csv";
  List<List<dynamic>> data=await loadCsvData(path);

  return loadAyaTable(data);

  // print(data.length);

}

 loadAyaTable(List<List<dynamic>> data) async
{

  var ayatList = await  loadAyatText('assets/Ayat.txt');
  ayatList.removeAt(0);
  var surahsNames=await  loadSurahsNames();
  List <dynamic> surahNumbers= [];

  List<dynamic> coordinates_aya=[];

  List<List<dynamic>> aya_details=[];

  List<Map<String, dynamic>> load_aya=[];

  List<Map<String, dynamic>> surahs=[];

  int last_surah=data[1][7];
  int current_surah=data[1][7];
  surahNumbers.add(data[1][4]);

  int i=1;

   int surahIndex=1;

  surahs.add({
    "surah_number":1,
    "surah_name": surahsNames[0],
    "surah_page": data[1][4]
  });

  while (i<data.length)
  {
    last_surah=data[i][7];



    String coord="";
    int last_aya=data[i][6];
    coord=coord+data[i][0].toString()+","+data[i][1].toString()+","+data[i][2].toString()+","+data[i][3].toString()+",";

    int inc_ind=1;

    for (int j=i+1;j<data.length;j++)
    {
      int current_aya=data[j][6];
      current_surah=data[j][7];
      if (last_surah==current_surah && last_aya==current_aya)
      {
        inc_ind++;
        coord=coord+data[j][0].toString()+","+data[j][1].toString()+","+data[j][2].toString()+","+data[j][3].toString()+",";
      }
      else if (last_surah!=current_surah && last_aya!=current_aya )
        {

          surahs.add({
            "surah_number":current_surah,
            "surah_name": surahsNames[surahIndex],
            "surah_page": data[j][4]
          });
          surahIndex+=1;

          break;
        }
      else
      {
        break;
      }
    }



    load_aya.add({

      "aya_number":last_aya,
      "aya_coordinates": coord,
      "page_number":data[i][4],
    });
    i=i+inc_ind;

    aya_details.add([coord,last_aya]);

    // aya_id++;

    coordinates_aya.add(coord);

  }



  int current_s=1;
  int index= 0;


  for (int k=0;k<load_aya.length;k++)
  {

    load_aya[k]['aya_text']= ayatList[k][2];
    load_aya[k]['surah_number']= ayatList[k][0];

    if (int.parse(load_aya[k]['surah_number'])!=current_s)
      {

        index+=1;
        current_s+=1;

      }
    load_aya[k]['surah_name']= surahsNames[index];
  }



  // for (int k=0;k<surahs.length;k++)
  //   {
  //     print(surahs[k]["surah_page"]);
  //
  //   }
  // print("ABL EL RETUUUUUUUUUUUUURN------------------------");

  return [load_aya,surahs];

}




