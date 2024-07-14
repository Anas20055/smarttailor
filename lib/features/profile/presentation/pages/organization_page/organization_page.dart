import 'package:flutter/material.dart';

class ProfileOrganizationPage extends StatefulWidget {
  const ProfileOrganizationPage({super.key});

  @override
  State<ProfileOrganizationPage> createState() =>
      _ProfileOrganizationPageState();
}

class _ProfileOrganizationPageState extends State<ProfileOrganizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Организация'),
      ),
    );
  }
}
