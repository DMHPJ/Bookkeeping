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
      height: 200.h,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 160.w,
            margin: EdgeInsets.only(right: 30.w),
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBE6),
              borderRadius: BorderRadius.all(Radius.circular(50.r)),
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(data?.icon ?? ""),
            ),
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
                      data?.categoryName ?? "",
                      style: TextStyle(
                        fontSize: 40.r,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (data?.remark != null) ...[
                      Text(
                        data?.remark ?? "",
                        style: TextStyle(fontSize: 34.r),
                      ),
                    ],
                  ],
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 420.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        data?.money != null
                            ? "￥${numberFormat.format(double.parse(data?.money ?? "0"))}"
                            : "",
                        style: TextStyle(
                          fontSize: 40.r,
                          fontWeight: FontWeight.w600,
                          color:
                              data?.transactionType == 1
                                  ? Colors.deepOrange.shade700
                                  : (data?.transactionType == 2
                                      ? Colors.green.shade700
                                      : Colors.black87),
                        ),
                      ),
                      if (data?.moneyTo != null) ...[
                        Text(
                          "${data?.moneyFrom} -> ${data?.moneyTo}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 30.r),
                        ),
                      ] else ...[
                        Text(
                          data?.moneyFrom ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 30.r),
                        ),
                      ],
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
