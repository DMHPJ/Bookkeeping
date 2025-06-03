import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/bill_chr_list_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

final numberFormat = NumberFormat("##,##0.00", "en_US");

class BillItem extends StatelessWidget {
  final BillChrItemData? data;
  const BillItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Row(
        children: [
          Container(
            width: 66.w,
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBE6),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(data?.icon ?? ""),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data?.categoryName ?? "",
                      style: TextStyle(
                        fontSize: 16.r,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      data?.money != null
                          ? "￥${numberFormat.format(double.parse(data?.money ?? "0"))}"
                          : "",
                      style: TextStyle(
                        fontSize: 16.r,
                        fontWeight: FontWeight.w600,
                        color:
                            data?.transactionType == 1
                                ? Colors.deepOrange.shade700
                                : (data?.transactionType == 2
                                    ? Colors.green.shade700
                                    : Colors.black87),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                if (data?.moneyTo != null) ...[
                  Text(
                    "${data?.moneyFrom} -> ${data?.moneyTo}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.r),
                  ),
                ] else ...[
                  Text(
                    data?.moneyFrom ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.r),
                  ),
                ],
                SizedBox(height: 3.h),
                Text(data?.remark ?? "无备注", style: TextStyle(fontSize: 12.r)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
