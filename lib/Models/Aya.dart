import 'dart:typed_data';

class Aya{
  int? id;
  Uint8List? ayaPhote;  // TODO: Change if not image
  String? surahName;
  int? ayaNumber;
  String? ayaCoordinates;


  Aya({this.ayaPhote, this.surahName, this.ayaNumber,this.ayaCoordinates , this.id});


  Aya.fromMap(Map map) {
    id = map[id];
    surahName = map[surahName];
    ayaNumber = map[ayaNumber];
    ayaCoordinates = map[ayaCoordinates];
    ayaPhote = map[ayaPhote];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "surah_name": surahName,
    "aya_nmber":ayaNumber,
    "aya_coordinates": ayaCoordinates,
    "ayaPhoto": ayaPhote,
  };

}