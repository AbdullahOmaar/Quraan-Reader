
import 'dart:typed_data';



class Favorite{
  int? id;
  String? aya;  // TODO: Change if not image
  String? surahName;
  int? ayaNumber;
  int? pageNumber;


  Favorite({this.aya, this.surahName, this.ayaNumber,this.pageNumber , this.id});

  Favorite.fromMap(Map map) {
    id = map[id];
    aya=map[aya];
    surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    pageNumber = map[pageNumber];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "aya":aya,
    "surah_name": surahName,
    "aya_number":ayaNumber,
    "page_number": pageNumber,
  };



}
List<Favorite> convertToModel(List<dynamic>data)
{
  return   List.generate(data.length, (i) {
    return Favorite(
      id: data[i]['id'],
      aya:data[i]['aya'],
      surahName: data[i]['surah_name'],
      ayaNumber:data[i]['aya_number'],
      pageNumber: data[i]['page_number'],
      // Same for the other properties
    );
  });
}