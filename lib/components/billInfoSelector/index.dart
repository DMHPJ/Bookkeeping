import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillInfoSelector extends StatelessWidget {
  const BillInfoSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: () {
            // TODO: 选择资产
          },
          child: Container(
            padding: EdgeInsets.all(6.h),
            decoration: BoxDecoration(
              color: AppColors.inputFillLight,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 12.r,
                  color: AppColors.textGray,
                  
                ),
                SizedBox(width: 4.w),
                Text(
                  "选择资产",
                  style: TextStyle(fontSize: 12.r, color: AppColors.textGray),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: () {
            // TODO: 选择日期
          },
          child: Container(
            padding: EdgeInsets.all(6.h),
            decoration: BoxDecoration(
              color: AppColors.inputFillLight,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 12.r,
                  color: AppColors.textGray,
                ),
                SizedBox(width: 4.w),
                Text(
                  "今天",
                  style: TextStyle(fontSize: 12.r, color: AppColors.textGray),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
