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
      nomorAyat: json["nomorAyat"],
      teksArab: json["teksArab"],
      teksIndonesia: json["teksIndonesia"],
    );
  }
}

class DataSurah {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final List<Ayat> ayat;

  DataSurah(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.ayat});

  factory DataSurah.fromJson(Map<String, dynamic> json) {
    var list = json["ayat"] as List;
    List<Ayat> listAyat = list.map((i) => Ayat.fromJson(i)).toList();
    return DataSurah(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        ayat: listAyat);
  }
}

Future<DataSurah> fetchDetailSurah(int endpoint) async {
  final response =
      await http.get(Uri.parse("https://equran.id/api/v2/surat/$endpoint"));

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final dataSurah = responseBody['data'];
    return DataSurah.fromJson(dataSurah);
  } else {
    throw Exception('Failed to load data');
  }
}
