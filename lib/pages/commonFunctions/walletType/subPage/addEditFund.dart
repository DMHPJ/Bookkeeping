import 'package:flutter/material.dart';

class AddEditFund extends StatefulWidget{
  const AddEditFund({super.key,});
  @override
  State<StatefulWidget> createState() {
    return _AddEditFundState();
  }
}

class _AddEditFundState extends State<AddEditFund>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("添加/编辑"),
      ),
      body: Text("添加/编辑"),
    );
  }
}