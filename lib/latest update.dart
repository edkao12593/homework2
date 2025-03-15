import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(LatestUpdateApp());
}

class LatestUpdateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latest Updates UI',
      debugShowCheckedModeBanner: false,
      home: LatestUpdateScreen(),
    );
  }
}

class LatestUpdateScreen extends StatefulWidget {
  @override
  _LatestUpdateScreenState createState() => _LatestUpdateScreenState();
}

class _LatestUpdateScreenState extends State<LatestUpdateScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Updates'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LatestUpdateBox(scrollController: _scrollController),
        ),
      ),
    );
  }
}

class LatestUpdateBox extends StatelessWidget {
  final ScrollController scrollController;
  const LatestUpdateBox({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // adjust as needed
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LatestUpdateHeader(),
          SizedBox(height: 16),
          Container(
            height: 300, // Shorter height for the overall UI.
            child: RawScrollbar(
              controller: scrollController,
              thumbColor: Colors.red,
              thickness: 12,
              radius: Radius.circular(6),
              child: SingleChildScrollView(
                controller: scrollController,
                child: LatestUpdateList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LatestUpdateHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.circle, size: 24, color: Colors.blue),
        SizedBox(width: 8),
        Expanded(
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/latest_updates.svg',
              height: 35,
              placeholderBuilder: (context) => Text(
                'Latest Updates',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                    color:Color(0xFF0B3871)
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Icon(Icons.circle, size: 24, color: Colors.blue),
      ],
    );
  }
}

class LatestUpdateList extends StatelessWidget {
  final List<LatestUpdateItemData> updates = [
    LatestUpdateItemData(
      time: '2025.1.16',
      text:
      'maimai DX PRiSM International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2024.7.25',
      text:
      'maimai DX BUDDiES PLUS International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2024.1.18',
      text:
      'maimai DX BUDDiES International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2023.7.27',
      text:
      'maimai DX FESTiVAL PLUS International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2023.1.19',
      text:
      'maimai DX FESTiVAL International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2022.7.28',
      text:
      'maimai DX UNiVERSE PLUS International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2022.1.27',
      text:
      'maimai DX UNiVERSE International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2021.7.30',
      text:
      'maimai DX スプラッシュ PLUS International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2021.1.29',
      text:
      'maimai DX スプラッシュ International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2020.7.29',
      text:
      'maimai DX PLUS International Version is launched!\n(The launching date may be different in countries/ areas/ store.)',
    ),
    LatestUpdateItemData(
      time: '2019.11.25',
      text: 'The official Facebook Page is now available!',
    ),
    LatestUpdateItemData(
      time: '2019.11.25',
      text: 'The official website is now available!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      updates.map((update) => LatestUpdateItem(data: update)).toList(),
    );
  }
}

class LatestUpdateItem extends StatelessWidget {
  final LatestUpdateItemData data;

  const LatestUpdateItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              data.text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LatestUpdateItemData {
  final String time;
  final String text;

  LatestUpdateItemData({required this.time, required this.text});
}
