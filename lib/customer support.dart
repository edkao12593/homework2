import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Support Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // No AppBar
        body: Center(
          child: CustomerSupportButton(),
        ),
      ),
    );
  }
}

class CustomerSupportButton extends StatelessWidget {
  const CustomerSupportButton({Key? key}) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse("https://forms.office.com/r/68dCixgGfw/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade700,
              offset: const Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'CUSTOMER SUPPORT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.open_in_new,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
