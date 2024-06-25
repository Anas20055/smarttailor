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
        title: const Text('NotifcationsPage'),
      ),
    );
  }
}
