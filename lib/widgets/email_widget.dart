import 'package:flutter/material.dart';
import '../model/email.dart';
import '../screens/detail_screen.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final VoidCallback onMarkAsRead;

  const EmailWidget(
      {super.key, required this.email, required this.onMarkAsRead});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: email.read ? Color(0xFFFFF1F8) : Color(0xFFFDECEF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        email.subject,
        style: TextStyle(
          fontWeight: email.read ? FontWeight.normal : FontWeight.bold,
          color: email.read ? Colors.grey : Color(0xFF6D214F),
        ),
      ),
      subtitle: Text(
        email.from,
        style: TextStyle(color: Color(0xFF9C5675)),
      ),
      trailing: email.read
          ? null
          : Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: Color(0xFFE91E63),
                shape: BoxShape.circle,
              ),
            ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(email: email),
          ),
        ).then((_) {
          onMarkAsRead();
        });
      },
    );
  }
}
