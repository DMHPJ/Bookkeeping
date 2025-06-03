import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/wallet_list_data.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

final numberFormat = NumberFormat("##,##0.00", "en_US");

class WalletItem extends StatelessWidget {
  final WalletItemData? data;
  const WalletItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Row(
        children: [
          Container(
            width: 46.w,
            margin: EdgeInsets.only(right: 8.w),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBE6),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: GetSvg.url(data?.walletTypeIcon ?? ""),
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
                        fontSize: 14.r,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      data?.walletTypeName ?? "",
                      style: TextStyle(fontSize: 14.r),
                    ),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 220.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "￥${numberFormat.format(double.parse(data?.walletAmount ?? "0"))}",
                        style: TextStyle(
                          fontSize: 14.r,
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
