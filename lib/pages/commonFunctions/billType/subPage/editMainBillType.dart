import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottomButton/index.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class EditMainBillType extends StatefulWidget {
  final BillTypeItemData? argument;
  const EditMainBillType({super.key, this.argument});

  @override
  State<StatefulWidget> createState() {
    return _EditMainBillTypeState();
  }
}

class _EditMainBillTypeState extends State<EditMainBillType> {
  final logger = Logger();
  final _editBillTypeFormKey = GlobalKey<FormState>();
  late BillTypeItemData billTypeForm;

  @override
  void initState() {
    super.initState();
    billTypeForm = widget.argument ?? BillTypeItemData();
  }

  void validForm() {
    if(_editBillTypeFormKey.currentState!.validate()){
      _editBillTypeFormKey.currentState!.save();
      logger.i(billTypeForm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("添加主类"), centerTitle: true),
      body: Form(
        key: _editBillTypeFormKey,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "分类名称",
                      hintText: "限4个中文字符或10个英文字符",
                      filled: true, // 填充背景颜色
                      fillColor: Colors.grey.shade200, // 设置淡灰色背景
                      contentPadding: EdgeInsets.only(left: 40.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r), // 设置圆角
                        borderSide: BorderSide.none, // 去掉边框
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '分类名称';
                      }
                      return null;
                    },
                    onSaved: (value) => billTypeForm.name = value,
                  ),
                  Container(
                    margin: EdgeInsets.all(20.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("建议使用 emoji 😊 开头，图标默认为开头首个字符"),
                        // Text("选择分类图标后名称将自动填充，也可以自行修改分类名称"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(buttonText: "保存", onPressed: validForm)
          ],
        ),
      ),
    );
  }
}
