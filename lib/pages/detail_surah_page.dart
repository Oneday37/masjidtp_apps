// import 'package:flutter/material.dart';
// import 'package:penulisan_ilmiah_application/services/api/detail_surah.dart';

// import '../services/api/quran.dart';

// class DetailSurahPage extends StatelessWidget {
//   Data data;
//   DetailSurahPage({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(data.namaLatin),
//       ),
//       body: FutureBuilder(
//           future: fetchDataSurah(data.nomor),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return buildViewSurah(snapshot.data as List<Ayat>);
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }),
//     );
//   }
// }

// Widget buildViewSurah(List<Ayat> data2) {
//   return ListView.builder(
//       itemCount: data2.length,
//       itemBuilder: (context, index) {
//         final getData2 = data2[index];
//         return Card(
//           child: Text(getData2.teksArab),
//         );
//       });
// }
