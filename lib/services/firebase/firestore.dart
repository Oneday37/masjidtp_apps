import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference collectionRefKegiatan =
    firestore.collection("Kegiatan Masjid");
CollectionReference collectionRefJadwal = firestore.collection("Jadwal Jum'at");
CollectionReference collectionRefKas = firestore.collection("Keuangan Masjid");

Reference reference = FirebaseStorage.instance.ref();
Reference referenceImage = reference.child("dokumentasi/");
