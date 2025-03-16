import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'background.dart';
import 'topkv.dart';
import 'top link.dart';
import 'latest inforrmation.dart' as latest_information;
import 'latest update.dart' as latest_update;
import 'customer support.dart' as customer_support;
import 'footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combined App',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _latestUpdateScrollController = ScrollController();
  bool _showToTopButton = false;

  @override
  void initState() {
    super.initState();
    _mainScrollController.addListener(() {
      if (_mainScrollController.offset > 0 && !_showToTopButton) {
        setState(() {
          _showToTopButton = true;
        });
      } else if (_mainScrollController.offset <= 0 && _showToTopButton) {
        setState(() {
          _showToTopButton = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _mainScrollController.dispose();
    _latestUpdateScrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _mainScrollController.animateTo(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundEffect(),
          SingleChildScrollView(
            controller: _mainScrollController,
            child: Column(
              children: [
                TopKVWidget(),
                SizedBox(height: 20),
                TopLinkIcons(),
                SizedBox(height: 20),
                latest_information.LatestUpdateBox(),
                SizedBox(height: 20),
                latest_update.LatestUpdateBox(
                  scrollController: _latestUpdateScrollController,
                ),
                SizedBox(height: 20),
                ChunithmSection(),
                SizedBox(height: 20),
                customer_support.CustomerSupportButton(),
                SizedBox(height: 20),
                FooterWidget(),
                SizedBox(height: 40),
              ],
            ),
          ),
          if (_showToTopButton)
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: _scrollToTop,
                child: Image.asset(
                  'assets/img/common/top.png',
                  width: 50,
                  height: 50,
                  semanticLabel: 'TOP',
                ),
              ),
            ),
        ],
      ),
    );
  }
}


class ChunithmSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final url = Uri.parse('https://chunithm.sega.com/');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Semantics(
          label: 'CHUNITHM SUN PLUS',
          child: Image.asset('assets/img/top/btn_chu.png'),
        ),
      ),
    );
  }
}
