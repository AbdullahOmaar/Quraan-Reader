import 'dart:typed_data';

class Aya{
  int? id;
  // Uint8List? ayaPhote;  // TODO: Change if not image
  // String? surahName;
  int? ayaNumber;
  String? ayaCoordinates;
  int? pageNumber;
  String? surahName;
  String? ayaText;
  int? surahNumber;


  Aya({ this.ayaNumber,this.ayaCoordinates , this.id, this.ayaText, this.surahNumber, this.pageNumber, this.surahName});


  Aya.fromMap(Map map) {
    id = map[id];
    // surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    ayaCoordinates = map[ayaCoordinates];
    ayaText = map[ayaText];
    surahNumber = map[surahNumber];
    pageNumber = map[pageNumber];
    surahName= map[surahName];
    // ayaPhote = map[ayaPhote];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    // "surah_name": surahName,
    "aya_number":ayaNumber,
    "aya_coordinates": ayaCoordinates,
    "page_number": pageNumber,
    "aya_text": ayaText,
    "surah_number":surahNumber,
    // "ayaPhoto": ayaPhote,
  };





}

List<Aya> convertToModel(List<dynamic>data)
{
  return   List.generate(data.length, (i) {
    return Aya(
      id: data[i]['id'],
      ayaNumber: data[i]['aya_number'],
      ayaCoordinates:data[i]['aya_coordinates'],

      pageNumber: data[i]['page_number'],
      ayaText: data[i]['aya_text'],
      surahNumber: data[i]['surah_number'],
      surahName: data[i]['surah_name']
      // Same for the other properties
    );
  });
}
