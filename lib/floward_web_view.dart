import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FlowardWebView extends StatefulWidget {
  const FlowardWebView({Key? key}) : super(key: key);

  @override
  State<FlowardWebView> createState() => _FlowardWebViewState();
}

class _FlowardWebViewState extends State<FlowardWebView> {
  late final Function(String sessionId) onSessionCreated;
  double _progress = 0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest:
              URLRequest(url: Uri.parse('https://floward.com/en-kw')),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
              onLoadStart: (controller, url) {
                print(url);
                var sessionIdKey = 'sessionIdKey';
                if (url?.queryParameters.containsKey(sessionIdKey) == true) {
                  onSessionCreated.call(url?.queryParameters[sessionIdKey] ?? '');
                }
              },
            ),
            _progress < 1 ? const SizedBox() : const SizedBox()
          ],
        ),
      ),
    );
  }
}