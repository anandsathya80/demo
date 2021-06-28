import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class Instagram extends StatefulWidget{
  State<StatefulWidget> createState() => _Instagram();
}

class _Instagram extends State<Instagram>{
  final Completer<WebViewController> _webcontrol =
  Completer<WebViewController>();

  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 22, color: Colors.black),),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 10,
        ),
        body: WebView(
          initialUrl: "https://www.instagram.com/afinajhrs_/?utm_medium=copy_link",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webiewController){
            _webcontrol.complete(webiewController);
          },

        ),
      ),
    );
  }

}
