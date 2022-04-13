
import 'dart:typed_data';


class Bookmark{
  int? id;
  String? ayaPhote;  // TODO: Change if not image
  String? surahName;
  int? ayaNumber;
  int? pageNumber;


  Bookmark({this.ayaPhote, this.surahName, this.ayaNumber,this.pageNumber , this.id});

  Bookmark.fromMap(Map map) {
    id = map[id];
    surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    pageNumber = map[pageNumber];
    ayaPhote = map[ayaPhote];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "surah_name": surahName,
    "aya_number":ayaNumber,
    "page_number": pageNumber,
    "aya_photo": ayaPhote,
  };

}
