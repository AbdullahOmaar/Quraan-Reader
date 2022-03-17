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


