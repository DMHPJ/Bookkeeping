import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/wallet_list_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

final numberFormat = NumberFormat("##,##0.00", "en_US");

class WalletItem extends StatelessWidget {
  final WalletItemData? data;
  const WalletItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 110.w,
            margin: EdgeInsets.only(right: 30.w),
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBE6),
              borderRadius: BorderRadius.all(Radius.circular(150.r)),
            ),
            child: FittedBox(fit: BoxFit.contain, child: Text("占")),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.walletName ?? "",
                      style: TextStyle(
                        fontSize: 40.r,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      data?.walletTypeName ?? "",
                      style: TextStyle(fontSize: 34.r),
                    ),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 420.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "￥${numberFormat.format(double.parse(data?.walletAmount ?? "0"))}",
                        style: TextStyle(
                          fontSize: 40.r,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
