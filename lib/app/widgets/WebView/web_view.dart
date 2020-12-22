import 'dart:async';

import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApleeksContent extends StatelessWidget {
  final String url;
  final String title;

  const WebViewApleeksContent({
    Key key,
    @required this.url,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<WebViewController> _webcontroller = Completer<WebViewController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Titulo no disponible'),
        actions: <Widget>[
          NavigationControls(_webcontroller.future),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                WebView(
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _webcontroller.complete(webViewController);
                  },
                  javascriptChannels: <JavascriptChannel>[
                    _toasterJavascriptChannel(context),
                  ].toSet(),
                  navigationDelegate: (NavigationRequest request) {
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    LoadingDialog.show(context);
                    print('Page started loading: $url');

                    //controller.loading = true;
                  },
                  onPageFinished: (String url) {
                    LoadingDialog.hide(context);
                    print('Page finished loading: $url');
                    //controller.loading = false;
                  },
                  gestureNavigationEnabled: true,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) => Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message.message)),
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady = snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async => await controller.canGoBack()
                      ? await controller.goBack()
                      : Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("Sin historial")),
                        ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async => await controller.canGoForward()
                      ? await controller.goForward()
                      : Scaffold.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ningún elemento en el historial"),
                          ),
                        ),
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady ? null : () => controller.reload(),
            ),
          ],
        );
      },
    );
  }
}
