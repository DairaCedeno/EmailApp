import 'package:flutter/material.dart';
import '../model/email.dart';
import '../widgets/email_widget.dart';
import '../model/backend.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Email> emails = [];

  @override
  void initState() {
    super.initState();
    loadEmails();
  }

  void loadEmails() async {
    emails = await Backend().getEmails();
    setState(() {});
  }

  void markAsRead(int id) {
    Backend().markEmailAsRead(id);
    setState(() {
      emails.firstWhere((email) => email.id == id).read = true;
    });
  }

  void deleteEmail(int id) {
    Backend().deleteEmail(id);
    setState(() {
      emails.removeWhere((emails) => emails.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mock Mail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFE091B7),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          final email = emails[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Dismissible(
              key: Key(email.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => deleteEmail(email.id),
              background: Container(
                color: Color(0xFFFFA6C9),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: Card(
                color: Color(0xFFFFF1F8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 3.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmailWidget(
                    email: email,
                    onMarkAsRead: () => markAsRead(email.id),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
