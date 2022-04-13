import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quraan_reader/Models/Aya.dart';
import 'package:sqflite/sqflite.dart';
import '../Services.dart';
// import 'package:sqflite/sqflite.dart';

import '../Models/Surah.dart';




class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'photo_name';
  static const String TABLE = 'PhotosTable';

  static const String DB_NAME = 'quraan_reader.db';


  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();
  static Database? _database;
  Future<Database?> get database async => _database ??= await _initDatabase();


  Future<Database?> _initDatabase() async {
    Directory documentDirectory =await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'quraan_reader.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,

    );
  }

  Future _onCreate(Database db,int version ) async {
    await db.execute(''' CREATE TABLE surah( 
    surah_number INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    surah_name varchar(50)
    )''' );

    await db.execute('''CREATE TABLE aya(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    aya_number INTEGER NOT NULL,
    aya_coordinates varchar(1000),
    aya_text TEXT,
    surah_number INTEGER
   
    )''');  // Parse Coordinates as follows: x1,y1,x2,y2,x3,...

    await db.execute('''CREATE TABLE favorite(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        aya BLOB,
        surah_name varchar(50),
        aya_number INTEGER,
        page_number INTEGER,
        
        CONSTRAINT fk_surah
          FOREIGN KEY (surah_name)
          REFERENCES surah(surah_name),
              
        CONSTRAINT fk_aya
          FOREIGN KEY (aya_number)
          REFERENCES aya(aya_number)
        )''');

    await db.execute('''CREATE TABLE note(
     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       surah_name varchar(50),
     page_number INTEGER,
     aya_number INTEGER,
     note_text TEXT,
     
     CONSTRAINT fk_surah
      FOREIGN KEY (surah_name)
        REFERENCES surah(surah_name),
     
     
     CONSTRAINT fk_aya
        FOREIGN KEY (aya_number)
        REFERENCES aya(aya_number)
    )''');

    db.execute('''CREATE TABLE bookmark(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    surah_name varchar(50),
    aya_number INTEGER,
    page_number INTEGER,
    aya_coordinates varchar(1000),
    
   CONSTRAINT fk_surah
    FOREIGN KEY (surah_name)
      REFERENCES surah(surah_name),
     
     
   CONSTRAINT fk_aya
      FOREIGN KEY (aya_number)
      REFERENCES aya(aya_number)
    
    )''' ); // TODO: EL aya nafsha hteb2a coordinates?

    insertIntoFav({
      "id": 1,
      "aya":"سبحان اللذي اسري بعبده ليلا من المسجد الحرام الي المسجد الاقصي اللذي باركنا حوله",
      "surah_name":"الاسراء",
      "aya_number": 4,
      "page_number":4,
    }, db);

    List<Map<String, dynamic>> data=await getData();
    // Database? db =await instance.database;
    for (int i=0;i<data.length;i++)
      {
        // print("ANA BA PRINT EL DATA");
        // print(i);
        insertIntoAya(data[i],db);
      }

    print("done with insert");


  // TODO: Write functions 3la 7asabe l queries el enti 3yzaha
  }

  Future<int?> insertIntoAya(Map<String, dynamic> aya, Database? db) async
  {


    return await db?.insert('aya', aya);
    
  }


  Future<int?> insertIntoFav(Map<String, dynamic> fav, Database? db) async
  {


    return await db?.insert('favorite', fav);

  }

  Future<int?> insertIntoNote(Map<String, dynamic> note, Database? db) async
  {


    return await db?.insert('note', note);

  }

  Future<int?> insertIntoBookMark(Map<String, dynamic> bookmark, Database? db) async
  {


    return await db?.insert('bookmark', bookmark);

  }



  Future<List?> readAllAya() async {
    final db = await instance.database;



    final result = await db?.query('aya');
    print("After read all aya");

    return result;
  }


  Future<List?> readFavTable() async {
    final db = await instance.database;



    final result = await db?.query('favorite');
    print("After read Favourite table");

    return result;
  }

  Future<List?> readBookmarkTable() async {
    final db = await instance.database;



    final result = await db?.query('bookmark');
    print("After read bookmark table");

    return result;
  }

  Future<List?> readNoteTable() async {
    final db = await instance.database;



    final result = await db?.query('note');
    print("After read note table");

    return result;
  }

 }



 // TODO: Write a function that reads the data from the csv file then stores it in the tables


  // Future<List<Surah>> getSurahs() async {
  //   Database db = await instance.database;
  //   var groceries = await db.query('groceries', orderBy: 'name');
  //   List<Grocery> groceryList = groceries.isNotEmpty
  //       ? groceries.map((c) => Grocery.fromMap(c)).toList()
  //       : [];
  //   return groceryList;
  // }




