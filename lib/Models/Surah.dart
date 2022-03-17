
import 'dart:typed_data';


class Surah{
  int? id;
  Uint8List? surahPhoto;

  Surah({this.surahPhoto, this.id});

  Surah.fromMap(Map map) {
    id = map[id];
    surahPhoto = map[surahPhoto];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "surah_photo": surahPhoto,
  };

}

