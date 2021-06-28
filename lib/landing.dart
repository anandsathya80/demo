import 'package:flutter/material.dart';
import 'package:uasmobile/views/home.dart';
import 'package:uasmobile/views/profile.dart';


class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:5),
                  child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         IconButton(icon: Icon(Icons.person), onPressed: (){
                           Navigator.push(context,
                               MaterialPageRoute(builder: (context) => Instagram()));
                         },)
                       ],
                     ),
                     Text(
                       'Selamat Datang di',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         letterSpacing: 0.2,
                         height: 1,
                         color: Colors.black,
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Text(
                       'Sistem Akademik',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         letterSpacing: 0.2,
                         height: 1,
                         color: Colors.blue,
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
//                     FlatButton(
//                       onPressed: (){
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Instagram()));
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Center(
//                             child: (Text("Profile",style: TextStyle(color: Colors.white),)),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.all(Radius.circular(100.0)),
//                         ),
//                       ),
//                     ),
                   ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/land.png'),
                    ],
                  )
                ),
              ],
            ),
          ),
            SizedBox(
              height: 190,
            ),
            FloatingActionButton(
                child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                ),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            )
        ],
      ),
    );
  }
}