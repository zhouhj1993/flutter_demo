import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  final String title;
  final Widget body;

  const ContainerView({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
