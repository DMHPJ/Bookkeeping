import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bill extends StatefulWidget {
  const Bill({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BillState();
  }
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("账单")),
      body: SafeArea(
        child: Container(child: InkWell(onTap: () => Navigator.pop(context))),
      ),
    );
  }
}
