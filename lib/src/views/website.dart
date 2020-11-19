import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebSiteView extends StatelessWidget {

  final String url;

  WebSiteView ({this.url});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      hidden: true,
      appBar: AppBar(
        title: Text("activcount.ca"),
        backgroundColor: Colors.green,
      ),
    );
  }

}