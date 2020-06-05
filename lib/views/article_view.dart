import 'dart:async';
import 'package:NewsApp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlView extends StatefulWidget {
  final String blogURL;
  ArticlView({@required this.blogURL});
  @override
  _ArticlViewState createState() => _ArticlViewState();
}

class _ArticlViewState extends State<ArticlView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCenter(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogURL,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
