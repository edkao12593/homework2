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
      // We don't use an AppBar so the entire screen shows our background.
      body: Stack(
        children: [
          // Background layer.
          BackgroundEffect(),
          // Foreground content.
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top KV section from topkv.dart.
                TopKVWidget(),
                SizedBox(height: 16),
                // Top Link Icons from top link.dart.
                TopLinkIcons(),
                SizedBox(height: 16),
                // Latest Information from latest inforrmation.dart.
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: latestInfo.LatestUpdateBox(),
                ),
                SizedBox(height: 16),
                // Latest Update from latest update.dart.
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

/// This widget wraps the Latest Update section from latest update.dart.
/// Since that widget requires a ScrollController, we create one here.
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
