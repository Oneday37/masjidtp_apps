import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../services/firebase/firestore.dart';

class EditKeuanganPage extends StatefulWidget {
  const EditKeuanganPage({super.key});

  @override
  State<EditKeuanganPage> createState() => _EditKeuanganPageState();
}

class _EditKeuanganPageState extends State<EditKeuanganPage> {
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _sisaKas = TextEditingController();
  TextEditingController _pemasukan = TextEditingController();
  TextEditingController _pengeluaran = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _sisaKas.addListener(() => _formatCurrency(_sisaKas));
    _pemasukan.addListener(() => _formatCurrency(_pemasukan));
    _pengeluaran.addListener(() => _formatCurrency(_pengeluaran));
  }

  @override
  void dispose() {
    _tanggal.dispose();
    _sisaKas.dispose();
    _pemasukan.dispose();
    _pengeluaran.dispose();
    super.dispose();
  }

  void _formatCurrency(TextEditingController controller) {
    String value = controller.text.replaceAll('.', '').replaceAll(',', '');
    if (value.isEmpty) return;

    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    final intValue = int.tryParse(value);
    if (intValue != null) {
      final newValue = formatter.format(intValue).replaceAll(',', '.');
      controller.value = controller.value.copyWith(
        text: newValue,
        selection: TextSelection.collapsed(offset: newValue.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keuangan Masjid", style: GoogleFonts.oswald(fontSize: 27)),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PERIODE", style: GoogleFonts.roboto(fontSize: 18)),
                const SizedBox(
                  height: 5,
                ),
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
                          borderRadius: BorderRadius.circular(15))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "HARAP MENGISIKAN TANGGAL PERIODE !";
                    }
                    return null;
                  },
                  onTap: () {
                    selectDate();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("SISA KAS MASJID",
                    style: GoogleFonts.roboto(fontSize: 18)),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _sisaKas,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixText: "Rp ",
                    prefixStyle: GoogleFonts.roboto(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "HARAH MENGISIKAN SALDO KAS !";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("PEMASUKAN KAS MASJID",
                    style: GoogleFonts.roboto(fontSize: 18)),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _pemasukan,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixText: "Rp ",
                    prefixStyle: GoogleFonts.roboto(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "HARAH MENGISIKAN PEMASUKAN MASJID !";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("PENGELUARAN KAS MASJID",
                    style: GoogleFonts.roboto(fontSize: 18)),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _pengeluaran,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixText: "Rp ",
                    prefixStyle: GoogleFonts.roboto(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "HARAH MENGISIKAN PENGELUARAN MASJID !";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  child: Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text("UPDATE",
                            style: GoogleFonts.roboto(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_tanggal.text == "" ||
                        _sisaKas.text == "" ||
                        _pemasukan.text == "" ||
                        _pengeluaran.text == "") {
                      _formKey.currentState?.validate();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red[600],
                          content: Text(
                            "HARAP MENGISIKAN SEMUA DATA !!!",
                            style: GoogleFonts.roboto(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    } else {
                      collectionRefKas.add({
                        'periodekas': _tanggal.text,
                        'sisaKas': int.parse(_sisaKas.text.replaceAll('.', '')),
                        'pemasukanKas':
                            int.parse(_pemasukan.text.replaceAll('.', '')),
                        'pengeluaranKas':
                            int.parse(_pengeluaran.text.replaceAll('.', '')),
                        'entryTime': FieldValue.serverTimestamp()
                      });
                      //Mengosongkan text field ketika data berhasil masuk
                      _tanggal.text = "";
                      _sisaKas.text = "";
                      _pemasukan.text = "";
                      _pengeluaran.text = "";
                      Get.back();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green[600],
                          content: Text(
                            "DATA KEUANGAN BERHASIL DISIMPAN",
                            style: GoogleFonts.roboto(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ]),
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
