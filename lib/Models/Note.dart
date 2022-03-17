import 'dart:typed_data';
import 'Aya.dart';


class Note{
  int? id;
  String? surahName;
  int? pageNumber;
  int? ayaNumber;
  String? note;
  Aya? aya;




  Note({this.surahName, this.pageNumber, this.ayaNumber,this.note , this.id});


  Note.fromMap(Map map) {
    id = map[id];
    surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    pageNumber = map[pageNumber];
    note= map[note];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "surah_name": surahName,
    "aya_number":ayaNumber,
    "page_number": pageNumber,
    "note": note,
  };


}