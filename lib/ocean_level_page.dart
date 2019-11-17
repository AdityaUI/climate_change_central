import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class oceanLevel extends StatefulWidget {

  @override
  _oceanLevelState createState() => new _oceanLevelState();
}

class _oceanLevelState extends State<oceanLevel> {

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Wate Level'),
        backgroundColor: Colors.black87,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://coast.noaa.gov/slr/#/layer/slr/0/-11581024.663779823/5095888.569004184/4/satellite/none/0.8/2050/interHigh/midAccretion',
        onWebViewCreated: (WebViewController webviewController) {
          _controller.complete(webviewController);
        },
      ),
    );
  }

}