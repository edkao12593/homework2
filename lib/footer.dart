import 'package:flutter/material.dart';

void main() => runApp(FooterApp());

class FooterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Footer UI',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Footer Example')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                color: Colors.grey[200],
                child: Center(child: Text("Content Above Footer")),
              ),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                      color:Color(0xFF0B3871)
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: Image.asset(
                        'assets/img/footer/footer_sns_fb.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: Image.asset(
                        'assets/img/footer/footer_sns_x.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: Image.asset(
                        'assets/img/footer/footer_sns_li.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // External image link.
                GestureDetector(
                  onTap: () {
                    // Handle tap
                  },
                  child: Image.asset(
                    'assets/img/external.jpg',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        '©SEGA. All rights reserved.\n\n©DWANGO Co., Ltd.\n"VOCALOID" and "VOCALO" are trademarks of Yamaha Corporation.',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: Image.asset(
                        'assets/img/footer/footer_logo.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
