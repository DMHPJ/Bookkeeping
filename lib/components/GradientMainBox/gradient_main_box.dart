import 'package:flutter/material.dart';

class GradientMainBox extends StatelessWidget {
  final String title;
  final Widget body;
  const GradientMainBox({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        surfaceTintColor: Color(0xFFF2F8FF),
        backgroundColor: Color(0xFFF2F8FF),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF2F8FF), Color(0xFFF9F9F9)],
            ),
          ),
          child: body,
        ),
      ),
    );
  }
}
