
import 'dart:typed_data';


class Surah{
  int? surahNumber;
  String? surahName;
  int? surahPage;

  Surah({this.surahName, this.surahNumber, this.surahPage});

  Surah.fromMap(Map map) {
    surahNumber = map['surah_number'];
    surahName = map['surah_name'];
    surahPage= map['surah_page'];
  }

}

List<Surah> convertToSurah(List<Map<String, dynamic>>? data)
{
  return   List.generate(data!.length, (i) {
    return Surah.fromMap(data[i]);
  });
}

