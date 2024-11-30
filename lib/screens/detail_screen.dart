import 'package:flutter/material.dart';
import '../model/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          email.subject,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFFE091B7),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: Color(0xFFF4B8CD), size: 24),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'From: ${email.from}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF6D214F),
                    ),
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.0, color: Color(0xFFFFD5E0)),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Color(0xFFF4B8CD), size: 20),
                SizedBox(width: 8),
                Text(
                  'Date: ${email.dateTime}',
                  style: TextStyle(color: Color(0xFF9C5675), fontSize: 15),
                ),
              ],
            ),
            Divider(thickness: 1.0, color: Color(0xFFFFD5E0)),
            SizedBox(height: 16),
            Text(
              email.subject,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFE91E63),
              ),
            ),
            SizedBox(height: 8),
            Text(
              email.body,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color(0xFF6D214F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
