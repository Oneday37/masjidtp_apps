import 'package:http/http.dart' as http;
import 'dart:convert';

class DataQuran {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  DataQuran(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti});

  factory DataQuran.fromJson(Map<String, dynamic> json) {
    return DataQuran(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"]);
  }
}

// class DataQuran {
//   final int nomor;
//   final String nama;
//   final String namaLatin;
//   final int jumlahAyat;
//   final String tempatTurun;
//   final String arti;

//   DataQuran(
//       {required this.nomor,
//       required this.nama,
//       required this.namaLatin,
//       required this.jumlahAyat,
//       required this.tempatTurun,
//       required this.arti});

//   factory DataQuran.fromJson(Map<String, dynamic> json) {
//     return DataQuran(
//         nomor: json["nomor"],
//         nama: json["nama"],
//         namaLatin: json["namaLatin"],
//         jumlahAyat: json["jumlahAyat"],
//         tempatTurun: json["tempatTurun"],
//         arti: json["arti"]);
//   }
// }

Future<List<DataQuran>> fetchDataQuran() async {
  final response =
      await http.get(Uri.parse("https://quran-api.santrikoding.com/api/surah"));

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final listSurah = responseBody as List;
    final result = listSurah.map((e) => DataQuran.fromJson(e)).toList();
    return result;
  } else {
    throw Exception('Failed to load data');
  }
}
