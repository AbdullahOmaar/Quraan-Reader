import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';

import '../Models/Surah.dart';




class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'photo_name';
  static const String TABLE = 'PhotosTable';

  static const String DB_NAME = 'photos.db';


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
    id INTEGER PRIMARY KEY,
    surah_name varchar(max),
    ayas BLOB
    )''' );

    await db.execute('''CREATE TABLE aya(
    id INTEGER PRIMARY KEY,
    surah_name varchar(max) ,
    aya_number INTEGER NOT NULL,
    aya_coordinates varchar(max),
    
    CONSTRAINT fk_surah
      FOREIGN KEY (surah_name)
      REFERENCES surah(surah_name)
 
    
    )''');  // Parse Coordinates as follows: x1,y1,x2,y2,x3,...

    await db.execute('''CREATE TABLE favorite(
        id INTEGER PRIMARY KEY,
        aya BLOB,
        surah_name varchar(max),
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
     id INTEGER PRIMARY KEY,
     surah_name varchar(max),
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
    id INTEGER PRIMARY KEY,
    surah_name varchar(max),
    aya_number INTEGER,
    page_number INTEGER,
    aya_coordinates varchar(max),
    
   CONSTRAINT fk_surah
    FOREIGN KEY (surah_name)
      REFERENCES surah(surah_name),
     
     
   CONSTRAINT fk_aya
      FOREIGN KEY (aya_number)
      REFERENCES aya(aya_number)
    
    )''' ); // TODO: EL aya nafsha hteb2a coordinates?


  // TODO: Write functions 3la 7asabe l queries el enti 3yzaha
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




