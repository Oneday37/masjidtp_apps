// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:penulisan_ilmiah_application/databases%20servies/firestore.dart';

// class EditKeuanganPage extends StatefulWidget {
//   const EditKeuanganPage({super.key});

//   @override
//   State<EditKeuanganPage> createState() => _EditKeuanganPageState();
// }

// class _EditKeuanganPageState extends State<EditKeuanganPage> {
//   TextEditingController sisaKas = TextEditingController();
//   TextEditingController pemasukanKas = TextEditingController();
//   TextEditingController pengeluaranKas = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Keuangan Masjid",
//           style: GoogleFonts.oswald(fontSize: 25),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 5),
//               child: Text(
//                 "Sisa Kas Masjid",
//                 style: GoogleFonts.nunitoSans(
//                     fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//             ),
//             TextFormField(
//                 controller: sisaKas,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     label: Text("Rp", style: GoogleFonts.nunitoSans()),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ))),
//             Padding(
//               padding: const EdgeInsets.only(top: 20, bottom: 5),
//               child: Text(
//                 "Pemasukan Kas Masjid",
//                 style: GoogleFonts.nunitoSans(
//                     fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//             ),
//             TextFormField(
//                 controller: pemasukanKas,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     label: Text("Rp", style: GoogleFonts.nunitoSans()),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ))),
//             Padding(
//               padding: const EdgeInsets.only(top: 20, bottom: 5),
//               child: Text(
//                 "Pengeluaran Kas Masjid",
//                 style: GoogleFonts.nunitoSans(
//                     fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//             ),
//             TextFormField(
//                 controller: pengeluaranKas,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     label: Text("Rp", style: GoogleFonts.nunitoSans()),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ))),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.red)),
//                     child: Text("Batal", style: TextStyle(color: Colors.white)),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     }),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStatePropertyAll(Colors.green)),
//                     child: Text(
//                       "Simpan",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     onPressed: () async {
//                       // if(collectionReference.doc() != null){
//                       //   DocumentSnapshot documentSnapshot = await collectionReference.doc(e.id).get();
//                       //   documentSnapshot.reference.update(
//                       //    'sisaKas': sisaKas.text,
//                       //   'pemasukan': pemasukanKas.text,
//                       //   'pengeluaran': pengeluaranKas.text,
//                       //   )
//                       // }
//                       collectionReference.add({
//                         'sisaKas': sisaKas.text,
//                         'pemasukan': pemasukanKas.text,
//                         'pengeluaran': pengeluaranKas.text,
//                       });
//                       sisaKas.text = '';
//                       pemasukanKas.text = '';
//                       pengeluaranKas.text = '';
//                     }),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
