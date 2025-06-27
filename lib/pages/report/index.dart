import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReportState();
  }
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("报表")),
      body: SafeArea(
        child: Container(
          child: InkWell(
            onTap: () => Get.back(),
          ),
        ),
      ),
    );
  }
}
