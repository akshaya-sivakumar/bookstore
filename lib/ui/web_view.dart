import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainerArguments {
  final String url, title;

  const WebViewContainerArguments(this.url, this.title);
}

class WebViewContainer extends StatefulWidget {
  static const String routeName = "/web_view";
  final WebViewContainerArguments? webviewArgs;

  const WebViewContainer(this.webviewArgs, {Key? key}) : super(key: key);

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late bool _isLoadingPage;

  final _key = UniqueKey();

  _WebViewContainerState();

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: <Color>[HexColor("#F67B50"), HexColor("#FBAA60")]),
          ),
        ),
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.webviewArgs!.title,
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0),
            ),
            Text(
              widget.webviewArgs!.url,
              style: const TextStyle(color: Colors.black87, fontSize: 10.0),
            ),
          ],
        ),
        elevation: 2,
      ),
      body: Stack(children: <Widget>[
        WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            webViewController.loadUrl(widget.webviewArgs!.url);
          },
          onPageFinished: (initialUrl) {
            setState(() {
              _isLoadingPage = false;
            });
          },
          navigationDelegate: (NavigationRequest request) {
            debugPrint('blocking navigation to $request');
            return NavigationDecision.prevent;
          },
        ),
        _isLoadingPage
            ? Container(
                alignment: FractionalOffset.center,
                child: const CircularProgressIndicator(
                    backgroundColor: Colors.black87,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              )
            : Container(),
      ]),
    );
  }
}
