
import 'dart:typed_data';



class Favorite{
  int? id;
  Uint8List? ayaPhote;  // TODO: Change if not image
  String? surahName;
  int? ayaNumber;
  int? pageNumber;


  Favorite({this.ayaPhote, this.surahName, this.ayaNumber,this.pageNumber , this.id});

  Favorite.fromMap(Map map) {
    id = map[id];
    surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    pageNumber = map[pageNumber];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "surah_name": surahName,
    "aya_number":ayaNumber,
    "page_number": pageNumber,
  };

}
