import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods{
  Future<void> addData(blogData) async{
    Firestore.instance.collection("data_sekolah").add(blogData).catchError((e){
      print(e);
    });
  }
  getData() async {
    return Firestore.instance.collection("data_sekolah").snapshots();
  }
}