import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class deforestation extends StatefulWidget {
  @override
  _deforestationState createState() => new _deforestationState();
}

class _deforestationState extends State<deforestation> {

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deforestation'
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.globalforestwatch.org/map?map=eyJjZW50ZXIiOnsibGF0IjozNi41Mzk3ODg4NjgxMjQ0NTQsImxuZyI6NjcuMDE5NTMxMjQ5OTg4NTV9LCJiZWFyaW5nIjowLCJwaXRjaCI6MCwiem9vbSI6MiwiZGF0YXNldHMiOlt7ImRhdGFzZXQiOiJmZGM4ZGMxYi0yNzI4LTRhNzktYjIzZi1iMDk0ODUwNTJiOGQiLCJsYXllcnMiOlsiNmY2Nzk4ZTYtMzllYy00MTYzLTk3OWUtMTgyYTc0Y2E2NWVlIiwiYzVkMWUwMTAtMzgzYS00NzEzLTlhYWEtNDRmNzI4YzA1NzFjIl0sIm9wYWNpdHkiOjEsInZpc2liaWxpdHkiOnRydWV9LHsiZGF0YXNldCI6IjcwZTI1NDljLWQ3MjItNDRhNi1hOGQ3LTRhMzg1ZDc4NTY1ZSIsImxheWVycyI6WyIzYjIyYTU3NC0yNTA3LTRiNGEtYTI0Ny04MDA1N2MxYTFhZDQiXSwib3BhY2l0eSI6MSwidmlzaWJpbGl0eSI6dHJ1ZX0seyJkYXRhc2V0IjoiODk3ZWNjNzYtMjMwOC00YzUxLWFlYjMtNDk1ZGUwYmRjYTc5IiwibGF5ZXJzIjpbImMzMDc1YzVhLTU1NjctNGIwOS1iYzBkLTk2ZWQxNjczZjhiNiJdLCJvcGFjaXR5IjoxLCJ2aXNpYmlsaXR5Ijp0cnVlLCJ0aW1lbGluZVBhcmFtcyI6eyJzdGFydERhdGUiOiIyMDAxLTAxLTAxIiwiZW5kRGF0ZSI6IjIwMTgtMDEtMDEiLCJ0cmltRW5kRGF0ZSI6IjIwMTgtMDEtMDEifX0seyJkYXRhc2V0IjoiMDQ0ZjRhZjgtYmU3Mi00OTk5LWI3ZGQtMTM0MzRmYzRhMzk0IiwibGF5ZXJzIjpbIjc4NzQ3ZWExLTM0YTktNGFhNy1iMDk5LWJkYjg5NDgyMDBmNCJdLCJvcGFjaXR5IjoxLCJ2aXNpYmlsaXR5Ijp0cnVlfV19&menu=eyJkYXRhc2V0Q2F0ZWdvcnkiOiIiLCJtZW51U2VjdGlvbiI6IiJ9',
        onWebViewCreated: (WebViewController webviewController) {
          _controller.complete(webviewController);
        },
      ),
    );
  }

}