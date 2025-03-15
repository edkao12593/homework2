import 'package:flutter/material.dart';

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
        Image.asset(
          'assets/img/top/btn_top_kop.png',
          width: 150,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/img/top/btn_top_4.png',
          width: 150,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
