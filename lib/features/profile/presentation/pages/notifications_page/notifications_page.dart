import 'package:flutter/material.dart';

class NotifcationsPage extends StatefulWidget {
  const NotifcationsPage({super.key});

  @override
  State<NotifcationsPage> createState() => _NotifcationsPageState();
}

class _NotifcationsPageState extends State<NotifcationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        margin: const EdgeInsets.fromLTRB(16, 35, 16, 16),
        child: Column(
          children: [Divider(), Text('Отметить все прочитанными')],
        ),
      ),
    );
  }
}
