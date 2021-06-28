import 'package:flutter/material.dart';
import 'package:uasmobile/service/crud_data.dart';
import 'package:uasmobile/views/create_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrudMethods crudMethods = new CrudMethods();
  Stream blogsStream;

  @override
  void initState() {
    super.initState();
    crudMethods.getData().then((result){
      setState((){
        blogsStream = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Data",
              style: TextStyle(fontSize: 22, color: Colors.black),),
            Text("Mahasiswa",style: TextStyle(fontSize: 22, color: Colors.blue),),
          ],
        ),
//        actions:[
//          IconButton(icon: Icon(Icons.qr_code, color: Colors.white,), onPressed: (){
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => null()));
//          },)
//        ],
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
      body: StreamBuilder(stream: blogsStream,builder: (context, snaphot){
        return ListView.builder(
            itemCount: snaphot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return BlogsTile(
                Nama: snaphot.data.documents[index].data['Nama'],
                Jurusan: snaphot.data.documents[index].data['Jurusan'],
                imgUrl: snaphot.data.documents[index].data['imgUrl'],
                Id: snaphot.data.documents[index].data['Id'],
              );
            }
        );
      }),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateData()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {

  String imgUrl, Jurusan, Nama, Id;
  BlogsTile({
    this.imgUrl,
    this.Id,
    this.Jurusan,
    this.Nama
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                Nama,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.school,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(Jurusan, style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
//                    children: [
////                      Icon(
////                        Icons.account_circle,
////                        color: Colors.yellow,
////                        size: 18,
////                      ),
//                      //SizedBox(width: 7),
//                      //Text(""),
//                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}