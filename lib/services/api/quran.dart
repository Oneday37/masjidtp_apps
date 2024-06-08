import 'package:http/http.dart' as http;
import 'dart:convert';

class Data {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;

  Data(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"]);
  }
}

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

Future<List<Data>> fetchDataQuran() async {
  final response = await http.get(Uri.parse("https://equran.id/api/v2/surat"));

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final listSurah = responseBody['data'] as List;
    final result = listSurah.map((e) => Data.fromJson(e)).toList();
    return result;
  } else {
    throw Exception('Failed to load album');
  }
}
