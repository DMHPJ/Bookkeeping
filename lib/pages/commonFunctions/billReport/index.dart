import 'package:flutter/material.dart';

class BillType extends StatefulWidget {
  const BillType({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BillTypeState();
  }
}

class _BillTypeState extends State<BillType> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('billReport'),
      ),
      body: const Center(
        child: Text('billReport'),
      ),
    );
  }
}