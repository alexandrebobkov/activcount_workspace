import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSiteView extends StatelessWidget {

  final String url;

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  WebSiteView ({
    @required this.url
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return WebviewScaffold(
      appBar: AppBar(
        toolbarOpacity: 0.7,
        elevation: 0,
        toolbarHeight: 0,
        centerTitle: true,
        brightness: Brightness.light,
        title: Text("activcount.ca"),
        /*leading: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),*/
        backgroundColor: Colors.green,
      ),
      url: url,
      withZoom: true,
      withLocalStorage: true,
      /*body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      )*/
    );
  }

}