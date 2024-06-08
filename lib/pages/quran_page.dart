import 'package:flutter/material.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../services/api/quran.dart';
// import 'detail_surah_page.dart';

// class QuranPage extends StatelessWidget {
//   const QuranPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Al-Qur'an"),
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.green[600],
//         ),
//         body: FutureBuilder<List<Data>>(
//             future: fetchDataQuran(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return buildView(snapshot.data as List<Data>);
//               }
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }));
//   }
// }

// Widget buildView(List<Data> data) {
//   return ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         final getData = data[index];
//         return ListTile(
//           leading: Text(
//             "${getData.nomor}",
//             style: GoogleFonts.roboto(fontSize: 15),
//           ),
//           title: Text(
//             getData.namaLatin,
//             style:
//                 GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text(
//             getData.arti,
//             style: GoogleFonts.oswald(fontSize: 15),
//           ),
//           trailing: Text(
//             getData.nama,
//             style: GoogleFonts.roboto(fontSize: 20),
//           ),
//           onTap: () {
//             Get.to(DetailSurahPage(data: getData));
//           },
//         );
//       });
// }
