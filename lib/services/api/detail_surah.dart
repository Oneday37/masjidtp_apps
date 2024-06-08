import 'package:http/http.dart' as http;
import 'dart:convert';

class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksIndonesia;

  Ayat(
      {required this.nomorAyat,
      required this.teksArab,
      required this.teksIndonesia});

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json["nomorAyat"] ?? 0,
      teksArab: json["teksArab"] ?? "Failed to get data",
      teksIndonesia: json["teksIndonesia"] ?? "Failed to get data",
    );
  }
}

Future<List<Ayat>> fetchDataSurah(int id) async {
  final response =
      await http.get(Uri.parse("https://equran.id/api/v2/surat/${id}"));
  print("https://equran.id/api/v2/surat/${id}");
  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final listAyat = responseBody['ayat'] as List;
    final result = listAyat.map((e) => Ayat.fromJson(e)).toList();
    return result;
  } else {
    throw Exception('Failed to load album');
  }
}
