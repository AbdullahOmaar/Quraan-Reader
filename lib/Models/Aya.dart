import 'dart:typed_data';

class Aya{
  int? id;
  // Uint8List? ayaPhote;  // TODO: Change if not image
  // String? surahName;
  int? ayaNumber;
  String? ayaCoordinates;
  String? ayaText;



  Aya({ this.ayaNumber,this.ayaCoordinates , this.id, this.ayaText});


  Aya.fromMap(Map map) {
    id = map[id];
    // surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    ayaCoordinates = map[ayaCoordinates];
    ayaText = map[ayaText];
    // ayaPhote = map[ayaPhote];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    // "surah_name": surahName,
    "aya_number":ayaNumber,
    "aya_coordinates": ayaCoordinates,
    "ayaText": ayaText
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
      // Same for the other properties
    );
  });
}
