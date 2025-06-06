import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class WalletTypeListItem extends StatefulWidget {
  final WalletTypeItemData data;
  const WalletTypeListItem({super.key, required this.data});

  @override
  State<StatefulWidget> createState() {
    return _WalletTypeListItemState();
  }
}

class _WalletTypeListItemState extends State<WalletTypeListItem> {
  var logger = Logger();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xFFE5E5E5))),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              Container(
                height: 66.h,
                width: 66.w,
                margin: EdgeInsets.only(right: 12.w),
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF2EF),
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                ),
                child: GetSvg.url("walletType/${widget.data.icon}"),
              ),
              Text(
                widget.data.name ?? "",
                style: TextStyle(fontSize: 14.r, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
