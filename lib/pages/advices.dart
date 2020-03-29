import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';


class AdvicePage extends StatelessWidget {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Advices for the public"),
        backgroundColor: Colors.deepOrange,
      ),
      body: WebView(
        initialUrl:
            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public",
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },
      ),
    );
  }
}