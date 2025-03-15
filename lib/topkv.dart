import 'package:flutter/material.dart';

void main() => runApp(TopKVApp());

class TopKVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top KV Section',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: TopKVWidget(),
          ),
        ),
      ),
    );
  }
}

class TopKVWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWide = screenWidth >= 769;
    final String backgroundAsset = isWide
        ? 'assets/img/prism/top/kv_pc.png'
        : 'assets/img/prism/top/kv.png';
    final String logoAsset = isWide
        ? 'assets/img/prism/top/kv_logo_pc.png'
        : 'assets/img/prism/top/kv_logo.png';

    final double fullHeight = screenWidth * 9 / 16;
    final double kvHeight = fullHeight * 0.8;

    return SizedBox(
      width: screenWidth,
      height: kvHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Image.asset(
              backgroundAsset,
              width: screenWidth,
              height: kvHeight,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -30,
            child: Center(
              child: Image.asset(
                logoAsset,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
