import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uasmobile/service/crud_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class CreateData extends StatefulWidget {
  @override
  _CreateDataState createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {

  String Nama, Jurusan, Id;
//  int Id = 0;

  File selectedImage;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();
  Future getImage() async{
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  uploadBlog() async {
    if(selectedImage != null){
      setState(() {
        _isLoading = true;
      });
      //uploading
      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref().child("dataImages")
          .child("${randomAlphaNumeric(9)}.jpg");
      final StorageUploadTask task = firebaseStorageRef.putFile(selectedImage);

      var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
      Map<String, String> blogMap = {
        "imgUrl": downloadUrl,
        "Nama": Nama,
        "NIM": Id,
        "Jurusan": Jurusan
      };

      crudMethods.addData(blogMap).then((value){
        Navigator.pop(context);
      });
    }else{}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tambah Data",
              style: TextStyle(fontSize: 22, color: Colors.black),),
            Text(" Mahasiswa",style: TextStyle(fontSize: 22, color: Colors.blue),)
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
      body: _isLoading? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ):Container(
        child: Column(
          children: [
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: selectedImage != null? Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(selectedImage, fit: BoxFit.cover,)
                ),
              ):Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.add_a_photo, color: Colors.black,),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Nama Mahasiswa"
                    ),
                    onChanged: (val){
                      Nama = val;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(
                        hintText: "NIM Mahasiswa"
                    ),
                    onChanged: (val){
                      Id = (val);
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(
                        hintText: "Jurusan Mahasiswa"
                    ),
                    onChanged: (val){
                      Jurusan = val;
                    },
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: (){
                      uploadBlog();
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        color: Colors.black12,
                        child: Text('upload', style: TextStyle(fontSize: 18),)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
