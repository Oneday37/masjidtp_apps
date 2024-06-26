import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:penulisan_ilmiah_application/services/firebase/firestore.dart';

class TambahJadwalPage extends StatefulWidget {
  const TambahJadwalPage({super.key});

  @override
  State<TambahJadwalPage> createState() => _TambahJadwalPageState();
}

class _TambahJadwalPageState extends State<TambahJadwalPage> {
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _judul = TextEditingController();
  TextEditingController _deskripsi = TextEditingController();
  XFile? image;
  UploadTask? uploadTask;

  @override
  void dispose() {
    _tanggal.dispose();
    _judul.dispose();
    _deskripsi.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tambah Kegiatan", style: GoogleFonts.oswald(fontSize: 27)),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TANGGAL",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  const SizedBox(height: 5),

                  //TextField Tanggal
                  TextFormField(
                    controller: _tanggal,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "HARI / BULAN / TAHUN",
                      hintStyle:
                          GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "HARAP MENGISIKAN TANGGAL KEGIATAN !";
                      }
                      return null;
                    },
                    onTap: () {
                      selectDate();
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "NAMA KEGIATAN",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  const SizedBox(height: 5),

                  //TextField Nama Kegiatan
                  TextFormField(
                    controller: _judul,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "HARAP MENGISIKAN NAMA KEGIATAN !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "DESKRIPSI",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  const SizedBox(height: 5),

                  //TextField Deskripsi Kegiatan
                  TextFormField(
                    controller: _deskripsi,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    maxLines: 5,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "HARAP MENGISIKAN DESKRIPSI KEGIATAN !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "GAMBAR KEGIATAN",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),

                  //Input Gambar
                  GestureDetector(
                    child: Center(
                      child: image == null
                          ? Image.asset(
                              "assets/upload_image.jpg",
                              height: 250,
                              width: 250,
                              fit: BoxFit.cover,
                            )
                          : AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    onTap: () async {
                      final picture = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (picture != null) {
                        image = picture;
                        setState(() {});
                      }
                    },
                  ),

                  //Button SImpan
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: GestureDetector(
                        child: Center(
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              color: Colors.green[600],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text("SIMPAN",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        onTap: () async {
                          final ref = referenceImage.child(image!.name);
                          uploadTask = ref.putFile(File(image!.path));
                          final urlImage = await ref.getDownloadURL();

                          if (_tanggal.text == "" ||
                              _judul.text == "" ||
                              _deskripsi.text == "") {
                            _formKey.currentState?.validate();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red[600],
                                content: Text(
                                  "HARAP MENGISIKAN SEMUA DATA !!!",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          } else {
                            collectionRefKegiatan.add({
                              "tanggalKegiatan": _tanggal.text,
                              "namaKegiatan": _judul.text,
                              "deskripsiKegiatan": _deskripsi.text,
                              "dokumentasiKegiatan": urlImage,
                              'entryTime': FieldValue.serverTimestamp()
                            });
                            //Mengosongkan Data
                            _tanggal.text = "";
                            _judul.text = "";
                            _deskripsi.text = "";
                            Get.back();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green[600],
                                content: Text(
                                  "KEGIATAN BERHASIL DISIMPAN",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future selectDate() async {
    DateTime? setDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (setDate != null) {
      setState(() {
        _tanggal.text = DateFormat("d MMMM yyyy").format(setDate).toString();
      });
    }
  }
}
