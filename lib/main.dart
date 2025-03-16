import 'package:flutter/material.dart';
import 'background.dart';
import 'footer.dart';
import 'latest inforrmation.dart' as latestInfo;
import 'latest update.dart' as latestUpdate;
import 'top link.dart';
import 'topkv.dart';

void main() {
  runApp(CombinedApp());
}

class CombinedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combined App',
      debugShowCheckedModeBanner: false,
      home: CombinedHomePage(),
    );
  }
}

class CombinedHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background layer.
          BackgroundEffect(),
          // Foreground content.
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TopKVWidget(),
                SizedBox(height: 16),
                TopLinkIcons(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: latestInfo.LatestUpdateBox(),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LatestUpdateSection(),
                ),
                SizedBox(height: 16),
                // Footer from footer.dart.
                FooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class LatestUpdateSection extends StatefulWidget {
  @override
  _LatestUpdateSectionState createState() => _LatestUpdateSectionState();
}

class _LatestUpdateSectionState extends State<LatestUpdateSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return latestUpdate.LatestUpdateBox(scrollController: _scrollController);
  }
}
