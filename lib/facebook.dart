import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FacebookEmbedApp());
}

class FacebookEmbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Embed UI',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TopFbBox(),
            ),
          ),
        ),
      ),
    );
  }
}

class TopFbBox extends StatelessWidget {
  const TopFbBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fbEmbedUrl = 'https://www.facebook.com/plugins/page.php?'
        'href=https%3A%2F%2Fwww.facebook.com%2FmaimaiDX%2F'
        '&tabs=timeline'
        '&width=500'
        '&height=400'
        '&small_header=true'
        '&adapt_container_width=true'
        '&hide_cover=false'
        '&show_facepile=false'
        '&appId=260529578700607';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4.0, 4.0),
            blurRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.circle, size: 24.0, color: Color(0xFF0B3871)),
                SizedBox(width: 8.0),
                // Header text.
                Expanded(
                  child: Center(
                    child: Text(
                      'Facebook',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B3871),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                // Right placeholder icon.
                Icon(Icons.circle, size: 24.0, color: Color(0xFF0B3871)),
              ],
            ),
          ),
          Container(
            height: 100.0,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final embedWidth = 100.0;
                return Center(
                  child: SizedBox(
                    width: embedWidth,
                    height: 400.0,
                    child: FacebookPageEmbed(url: fbEmbedUrl),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          // "Facebook page" button.
          ElevatedButton(
            onPressed: () async {
              final url = Uri.parse('https://www.facebook.com/maimaiDX/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Facebook page',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text.
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class FacebookPageEmbed extends StatefulWidget {
  final String url;
  const FacebookPageEmbed({Key? key, required this.url}) : super(key: key);

  @override
  _FacebookPageEmbedState createState() => _FacebookPageEmbedState();
}

class _FacebookPageEmbedState extends State<FacebookPageEmbed> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
