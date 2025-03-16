import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(TopLinkIconsApp());

class TopLinkIconsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Link Icons',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // No app bar!
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TopLinkIcons(),
            ),
          ),
        ),
      ),
    );
  }
}

class TopLinkIcons extends StatelessWidget {
  const TopLinkIcons({Key? key}) : super(key: key);

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        Image.asset(
          'assets/img/top/btn_top_1.png',
          width: 150,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/img/top/btn_top_2.png',
          width: 150,
          fit: BoxFit.contain,
        ),
        GestureDetector(
          onTap: () => _launchUrl('https://maimai.sega.jp/kop6th/'),
          child: Image.asset(
            'assets/img/top/btn_top_kop.png',
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
        GestureDetector(
          onTap: () => _launchUrl('https://maimaidx-eng.com/'),
          child: Image.asset(
            'assets/img/top/btn_top_4.png',
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
