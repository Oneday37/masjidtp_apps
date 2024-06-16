import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Kegiatan", style: GoogleFonts.oswald(fontSize: 27)),
        centerTitle: true,
      ),
    );
  }
}
