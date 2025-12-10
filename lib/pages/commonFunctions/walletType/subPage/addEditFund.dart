import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/GradientMainBox/gradient_main_box.dart';
import 'package:flutter_application_1/components/bottomButton/index.dart';
import 'package:flutter_application_1/components/titleWithIcon/title_with_icon.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/data/wallet_list_data.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

class AddEditFund extends StatefulWidget {
  final WalletTypeItemData? argument = Get.arguments;
  AddEditFund({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddEditFundState();
  }
}

class _AddEditFundState extends State<AddEditFund> {
  final logger = Logger();
  final _editWalletItemFormKey = GlobalKey<FormState>();
  late WalletItemData walletItemForm;
  bool createBill = true;

  @override
  void initState() {
    super.initState();
    logger.i(widget.argument);
    walletItemForm = WalletItemData(
      walletType: widget.argument?.type,
      walletTypeName: widget.argument?.name,
      walletTypeIcon: widget.argument?.icon,
      addCalculate: 1,
    );
  }

  Future toAddUpdateWallet() async {
    final String res = await Api.instance.updateWallet(walletItemForm);
    showToast(res);
    Get.back();
  }

  void validForm() {
    if (_editWalletItemFormKey.currentState!.validate()) {
      _editWalletItemFormKey.currentState!.save();
      toAddUpdateWallet();
      logger.i(walletItemForm);
    }
  }

  Widget backgroundCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.h,
        bottom: 12.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithIcon(title: title),
          SizedBox(height: 12.h),
          ...children,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientMainBox(
      title: "新建/编辑账户",
      body: Form(
        key: _editWalletItemFormKey,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  backgroundCard(
                    title: "资产类型",
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 36.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.r),
                              ),
                            ),
                            child: GetSvg.url(
                              "walletType/${walletItemForm.walletTypeIcon}",
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            walletItemForm.walletTypeName ?? "未选择",
                            style: TextStyle(
                              fontSize: 14.r,
                              color: Color(0xFF333333),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 20.r,
                            color: Color(0xFF2965FF),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  backgroundCard(
                    title: "基本信息",
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "账户名",
                          hintText: "限4个中文字符或10个英文字符",
                          filled: true, // 填充背景颜色
                          fillColor: Color(0xFFEEEEEE),
                          contentPadding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '分类名称';
                          }
                          return null;
                        },
                        onSaved: (value) => walletItemForm.walletName = value,
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "账户余额",
                          hintText: "限4个中文字符或10个英文字符",
                          filled: true, // 填充背景颜色
                          fillColor: Color(0xFFF2F2F2),
                          contentPadding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '分类名称';
                          }
                          return null;
                        },
                        onSaved: (value) => walletItemForm.walletAmount = value,
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  backgroundCard(
                    title: "余额同步",
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "同时记一笔账单",
                                style: TextStyle(
                                  fontSize: 14.r,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              Text(
                                "将金额记一笔对应类型的账单",
                                style: TextStyle(
                                  fontSize: 12.r,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Switch(
                            value: createBill,
                            onChanged: (value) => setState(() {
                              createBill = value;
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "如创建账户初始金额不为0并开启“同时记一笔账单”功能，将创建一笔调整资产的账单方便查看变动记录",
                        style: TextStyle(
                          fontSize: 12.r,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  backgroundCard(
                    title: "其他",
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "在资产页隐藏该资产",
                                style: TextStyle(
                                  fontSize: 14.r,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              Text(
                                "隐藏资产可在资产主页底部查看",
                                style: TextStyle(
                                  fontSize: 12.r,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Switch(
                            value: walletItemForm.showWallet == 1,
                            onChanged: (value) => setState(() {
                              walletItemForm.showWallet = value ? 1 : 0;
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "计入总资产",
                                style: TextStyle(
                                  fontSize: 14.r,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              Text(
                                "是否计入总资产计算",
                                style: TextStyle(
                                  fontSize: 12.r,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Switch(
                            value: walletItemForm.addCalculate == 1,
                            onChanged: (value) => setState(() {
                              walletItemForm.addCalculate = value ? 1 : 0;
                            }),
                          ),
                        ],
                      ),
                    ],
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
