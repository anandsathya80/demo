//import 'dart:async';
////import 'package:barcode_scan/barcode_scan.dart';
////import 'package:flutter/material.dart';
////import 'package:flutter/services.dart';
////import 'package:qrscan/qrscan.dart' as scanner;
////
////
////class HalamanQR extends StatefulWidget {
////  @override
////  _HalamanQRState createState() => _HalamanQRState();
////}
////
////class _HalamanQRState extends State<HalamanQR> {
////  String text = 'Hasil QR Scan';
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      appBar: AppBar(
////        backgroundColor: Colors.blue,
////        title: Text('QR Scan'),
////      ),
////      body: Center(
////        child: Column(
////          //mainAxisAlignment: MainAxisAlignment.center,
////          children: <Widget>[
////            Container(
////              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
////              child: Image.asset('images/61336.jpeg'),
////            ),
////            RaisedButton(
////              child: Text(
////                "Scan",
////                style: TextStyle(color: Colors.blue, fontSize: 20),
////              ),
////              onPressed: () async {
////                text = await scanner.scan();
////                setState(() {});
////              },
////            ),
////            SizedBox(
////              height: 30,
////            ),
////            Container(
////              decoration: BoxDecoration(
////                borderRadius: BorderRadius.only(
////                    topLeft: Radius.circular(2), topRight: Radius.circular(2)),
////                border: Border.all(
////                  width: 3,
////                  color: Colors.blue,
////                ),
////              ),
////              child: Text(text),
////            ),
////          ],
////        ),
////      ),
////    );
////  }
////}

//import 'dart:async';
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  String barcode = "";
//
//  @override
//  initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Barcode Scanner - googleflutter.com'),
//          ),
//          body: Center(
//            child: Column(
//              children: <Widget>[
//                Container(
//                  child: RaisedButton(
//                    onPressed: barcodeScanning,
//                    child: Text("Capture Image",
//                      style: TextStyle(fontSize: 20, color: Colors.white),
//                    ),
//                    color: Colors.green,
//                  ),
//                  padding: const EdgeInsets.all(10.0),
//                  margin: EdgeInsets.all(10),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                ),
//                Text("Scanned Barcode Number",
//                  style: TextStyle(fontSize: 20),
//                ),
//                Text(barcode,
//                  style: TextStyle(fontSize: 25, color:Colors.green),
//                ),
//              ],
//            ),
//          )),
//    );
//  }
//
//  //scan barcode asynchronously
//  Future barcodeScanning() async {
//    try {
//      String barcode = await BarcodeScanner.scan();
//      setState(() => this.barcode = barcode);
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.cameraAccessDenied) {
//        setState(() {
//          this.barcode = 'No camera permission!';
//        });
//      } else {
//        setState(() => this.barcode = 'Unknown error: $e');
//      }
//    } on FormatException {
//      setState(() => this.barcode =
//      'Nothing captured.');
//    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
//    }
//  }
//}
//import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart';
//
//class HomeScreen extends StatefulWidget {
//  @override
//  _HomeScreenState createState() => _HomeScreenState();
//}
//
//class _HomeScreenState extends State<HomeScreen> {
//  String kode = "";
//  var getKode;
//  Future scanBarcode() async {
//    getKode = await BarcodeScanner.scan();
//    setState(() {
//      kode = getKode.rawContent;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        children: [
//          Container(
//            height: 10,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.only(
//                bottomLeft: Radius.circular(16.0),
//                bottomRight: Radius.circular(16.0),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 10.0,
//          ),
//          Image(image: AssetImage('asset/1956448.jpg')),
//          SizedBox(
//            height: 30.0,
//          ),
//
//          Text("HASIL SCAN:", style: TextStyle(fontSize: 30),),
//
//          FlatButton(
//            onPressed: kode == ""
//                ? () {}
//                : () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => null,
//                ),
//              );
//            },
//            child: Container(
//              width: double.infinity,
//              child: Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Center(
//                  child: kode == ""
//                      ? Text(
//                    "",
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.w800,
//                      fontSize: 16,
//                    ),
//                  )
//                      : Text(
//                    kode,
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.w300,
//                      fontSize: 16,
//                    ),
//                  ),
//                ),
//              ),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//                borderRadius: BorderRadius.all(Radius.circular(20.0)),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 250,
//          ),
//
//
//          FlatButton(
//            onPressed: () {
//              scanBarcode();
//            },
//            child: Container(
//              width: double.infinity,
//              child: Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Center(
//                  child: Image(image: AssetImage('asset/qr-code.png'), width: 60,),
////
//                ),
//              ),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//                borderRadius: BorderRadius.all(Radius.circular(100.0)),
//              ),
//            ),
//          ),
//          Text("SCAN DISINI", style: TextStyle(fontSize: 30),)
//        ],
//      ),
//    );
//  }
//}