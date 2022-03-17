import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';
import '../Models/Surah.dart';



// void saveSurah(Surah s) async {
//   var dbClient = await db;
//   await dbClient.insert("Surah", s.toMap());
// }