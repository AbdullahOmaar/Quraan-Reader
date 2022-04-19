
import 'dart:typed_data';


class Bookmark{
  int? id;
  String? aya_text;  // TODO: Change if not image
  String? surahName;
  int? ayaNumber;
  int? pageNumber;


  Bookmark({this.aya_text, this.surahName, this.ayaNumber,this.pageNumber , this.id});

  Bookmark.fromMap(Map map) {
    id = map[id];
    surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    pageNumber = map[pageNumber];
    aya_text = map[aya_text];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "surah_name": surahName,
    "aya_number":ayaNumber,
    "page_number": pageNumber,
    "aya_text": aya_text,
  };

}
List<Bookmark> convertToModel(List<dynamic>data)
{
  return   List.generate(data.length, (i) {
    return Bookmark(
      id: data[i]['id'],
      aya_text:data[i]['aya_text'],
      surahName: data[i]['surah_name'],
      ayaNumber:data[i]['aya_number'],
      pageNumber: data[i]['page_number'],
      // Same for the other properties
    );
  });
}