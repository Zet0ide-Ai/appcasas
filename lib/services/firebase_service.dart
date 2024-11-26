import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPersonajes() async{
  List Personajes = [];
  CollectionReference refPersonajes = db.collection('Personajes');

  QuerySnapshot queryPersonajes = await refPersonajes.get();

  queryPersonajes.docs.forEach((documento){
    Personajes.add(documento.data());
  });
  return Personajes;

}