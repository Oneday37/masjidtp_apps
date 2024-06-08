import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference collectionRefJadwal = firestore.collection("Jadwal Jum'at");
CollectionReference collectionRefKas = firestore.collection("Keuangan Masjid");
