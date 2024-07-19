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
  int? _sisaKasSebelumnya;
  DocumentSnapshot? _currentDocument;

  @override
  void initState() {
    super.initState();
    _sisaKas.addListener(() => _formatCurrency(_sisaKas));
    _pemasukan.addListener(() => _formatCurrency(_pemasukan));
    _pengeluaran.addListener(() => _formatCurrency(_pengeluaran));

    _fetchDataAkhir();
  }

  @override
  void dispose() {
    _tanggal.dispose();
    _sisaKas.dispose();
    _pemasukan.dispose();
    _pengeluaran.dispose();
    super.dispose();
  }

  Future<void> _fetchDataAkhir() async {
    try {
      final querySnapshot = await collectionRefKas
          .orderBy('entryTime', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        setState(() {
          _tanggal.text = data['periodeKas'] ?? '';
          _sisaKasSebelumnya = data['sisaKas'] ?? 0;
          _pemasukan.text = data['pemasukanKas']?.toString() ?? '';
          _pengeluaran.text = data['pengeluaranKas']?.toString() ?? '';
          _sisaKas.text = (data['sisaKas'] ?? 0).toString();
          _currentDocument = querySnapshot.docs.first;
        });
      } else {
        print('No data found.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
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

  void _perhitunganSisaKas() {
    final pemasukan = int.tryParse(_pemasukan.text.replaceAll('.', '')) ?? 0;
    final pengeluaran =
        int.tryParse(_pengeluaran.text.replaceAll('.', '')) ?? 0;

    if (_sisaKas.text.isEmpty) {
      _sisaKasSebelumnya = null;
      return; // Exit early if sisaKas is empty
    }

    if (_sisaKasSebelumnya != null) {
      final calculatedSisaKas =
          (_sisaKasSebelumnya ?? 0) + pemasukan - pengeluaran;
      _sisaKas.text =
          NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0)
              .format(calculatedSisaKas)
              .replaceAll(',', '.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Keuangan Masjid", style: GoogleFonts.oswald(fontSize: 27)),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 20),
            Text("PERIODE", style: GoogleFonts.roboto(fontSize: 18)),
            const SizedBox(height: 5),

            // TextField Tanggal
            TextFormField(
              controller: _tanggal,
              readOnly: true,
              decoration: InputDecoration(
                isDense: true,
                hintText: "HARI / BULAN / TAHUN",
                hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
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

            const SizedBox(height: 20),
            Text("PEMASUKAN KAS MASJID",
                style: GoogleFonts.roboto(fontSize: 18)),
            const SizedBox(height: 5),

            // TextField Pemasukan Kas
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
                  return "HARAP MENGISIKAN PEMASUKAN MASJID !";
                }
                return null;
              },
              onChanged: (value) {
                _perhitunganSisaKas();
              },
            ),
            const SizedBox(height: 20),
            Text("PENGELUARAN KAS MASJID",
                style: GoogleFonts.roboto(fontSize: 18)),
            const SizedBox(height: 5),

            // TextField Pengeluaran Kas
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
                  return "HARAP MENGISIKAN PENGELUARAN MASJID !";
                }
                return null;
              },
              onChanged: (value) {
                _perhitunganSisaKas();
              },
            ),
            const SizedBox(height: 20),
            Text("SISA KAS MASJID", style: GoogleFonts.roboto(fontSize: 18)),
            const SizedBox(height: 5),

            // TextField Sisa Kas
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
                  return "HARAP MENGISIKAN SALDO KAS !";
                }
                return null;
              },
              onChanged: (value) {
                if (value.isEmpty) {
                  _sisaKasSebelumnya = null;
                } else {
                  final parsedValue = int.tryParse(value.replaceAll('.', ''));
                  _sisaKasSebelumnya = parsedValue;
                }
                _perhitunganSisaKas();
              },
            ),
            const SizedBox(height: 50),

            // Button Simpan
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
                    child: Text("SIMPAN",
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              onTap: () {
                if (_tanggal.text.isEmpty ||
                    _sisaKas.text.isEmpty ||
                    _pemasukan.text.isEmpty ||
                    _pengeluaran.text.isEmpty) {
                  _formKey.currentState?.validate();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red[600],
                      content: Text(
                        "HARAP MENGISIKAN SEMUA DATA !!!",
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                } else {
                  collectionRefKas.add({
                    'periodeKas': _tanggal.text,
                    'sisaKas': int.parse(_sisaKas.text.replaceAll('.', '')),
                    'pemasukanKas':
                        int.parse(_pemasukan.text.replaceAll('.', '')),
                    'pengeluaranKas':
                        int.parse(_pengeluaran.text.replaceAll('.', '')),
                    'entryTime': FieldValue.serverTimestamp(),
                  });

                  // Mengosongkan text field ketika data berhasil masuk
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
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectDate() async {
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
