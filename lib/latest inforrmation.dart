import 'package:flutter/material.dart';

void main() => runApp(LatestUpdateApp());

class LatestUpdateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latest Update UI',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LatestUpdateBox(),
            ),
          ),
        ),
      ),
    );
  }
}

class LatestUpdateBox extends StatefulWidget {
  @override
  _LatestUpdateBoxState createState() => _LatestUpdateBoxState();
}

class _LatestUpdateBoxState extends State<LatestUpdateBox> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> imagePaths = [
    'assets/img/download/pop/download/2025-03-13-4/pop.jpg',
    'assets/img/download/pop/download/2025-03-13-3/pop.jpg',
    'assets/img/download/pop/download/2025-03-13-2/pop.jpg',
    'assets/img/download/pop/download/2025-03-13/pop.jpg',
    'assets/img/download/pop/download/2025-02-27/pop.jpg',
    'assets/img/download/pop/download/2025-02-14-4/pop.jpg',
    'assets/img/download/pop/download/2025-02-14-3/pop.jpg',
    'assets/img/download/pop/download/2025-02-14-2/pop.jpg',
    'assets/img/download/pop/download/2025-02-14/pop.jpg',
    'assets/img/download/pop/download/2025-01-31-2/pop.jpg',
    'assets/img/download/pop/download/2025-01-31/pop.jpg',
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _nextPage() {
    if (_currentPage < imagePaths.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LatestUpdateHeader(),
          SizedBox(height: 16),
          Container(
            height: 120, // Adjust height as needed.
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset(
                          imagePaths[index],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: Colors.red, size: 30),
                      onPressed: _previousPage,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios,
                          color: Colors.red, size: 30),
                      onPressed: _nextPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imagePaths.length, (index) {
              bool isActive = _currentPage == index;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                width: isActive ? 14 : 10,
                height: isActive ? 14 : 10,
                decoration: BoxDecoration(
                  color: isActive ? Colors.red : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}


class LatestUpdateHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 24, color: Colors.blue),
        SizedBox(width: 8),
        Expanded(
          child: Center(
            child: Text(
              'Latest Information',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                  color:Color(0xFF0B3871)
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
