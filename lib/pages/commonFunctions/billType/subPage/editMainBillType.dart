import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/GradientMainBox/gradient_main_box.dart';
import 'package:flutter_application_1/components/bottomButton/index.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

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
    logger.i(widget.argument);
    billTypeForm = widget.argument ?? BillTypeItemData();
  }

  Future toAddUpdateType() async {
    final String res = await Api.instance.updateBillType(billTypeForm);
    showToast(res);
    Get.back();
  }

  void validForm() {
    if (_editBillTypeFormKey.currentState!.validate()) {
      _editBillTypeFormKey.currentState!.save();
      toAddUpdateType();
      logger.i(billTypeForm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientMainBox(
      title: "添加主类",
      body: Form(
        key: _editBillTypeFormKey,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (billTypeForm.parentId != null) ...[
                    TextFormField(
                      readOnly: true,
                      initialValue: billTypeForm.parentName,
                      decoration: InputDecoration(
                        labelText: "一级分类",
                        filled: true, // 填充背景颜色
                        fillColor: Color(0xFFFFFFFF), // 设置淡灰色背景
                        contentPadding: EdgeInsets.only(
                          left: 24.w,
                          right: 16.w,
                          top: 16.h,
                          bottom: 16.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(99.r), // 设置圆角
                          borderSide: BorderSide.none, // 去掉边框
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(99.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(99.r),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Container(
                          height: 32.h,
                          width: 32.w,
                          margin: EdgeInsets.only(right: 12.w, bottom: 4.h),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(billTypeForm.parentIcon ?? ""),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "分类名称",
                      hintText: "限4个中文字符或10个英文字符",
                      filled: true, // 填充背景颜色
                      fillColor: Color(0xFFFFFFFF),
                      contentPadding: EdgeInsets.only(
                        left: 24.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 16.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r), // 设置圆角
                        borderSide: BorderSide.none, // 去掉边框
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Container(
                        height: 32.h,
                        width: 32.w,
                        margin: EdgeInsets.only(right: 12.w, bottom: 4.h),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(billTypeForm.icon ?? ""),
                        ),
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
                    margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("是否作为收入类型"),
                            Switch(
                              value: billTypeForm.isIncome == 1,
                              onChanged:
                                  (value) => setState(() {
                                    billTypeForm.isIncome = value ? 1 : 0;
                                  }),
                            ),
                          ],
                        ),
                        Text("建议使用 emoji 😊 开头，图标默认为开头首个字符"),
                        // Text("选择分类图标后名称将自动填充，也可以自行修改分类名称"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(buttonText: "保存", onPressed: validForm),
          ],
        ),
      ),
    );
  }
}
