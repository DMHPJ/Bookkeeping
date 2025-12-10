import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class BillTypeListItemIcon extends StatefulWidget {
  final BillTypeItemData data;
  const BillTypeListItemIcon({super.key, required this.data});

  @override
  State<StatefulWidget> createState() {
    return _BillTypeListItemIconState();
  }
}

class _BillTypeListItemIconState extends State<BillTypeListItemIcon> {
  var logger = Logger();

  void toSelectedItem(int index) {
    final isEdit = (index + 1) <= (widget.data.children?.length ?? 0);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.children!.isEmpty) {
      return Column(
        children: [
          Container(
            height: 46.h,
            width: 46.w,
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF2EF),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(widget.data.icon ?? ""),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            widget.data.name ?? "",
            style: TextStyle(fontSize: 10.r, fontWeight: FontWeight.w400),
          ),
        ],
      );
    } else {
      return CustomPopup(
        content: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: (widget.data.children?.length ?? 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // 列数
            mainAxisSpacing: 16.h, // 主轴间距
            crossAxisSpacing: 12.w, // 次轴间距
            childAspectRatio: 0.8857, // 宽高比例
          ),
          itemBuilder:
              (context, index) => Column(
                children: [
                  Container(
                    height: 46.h,
                    width: 46.w,
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF2EF),
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(widget.data.children?[index].icon ?? ""),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.data.children?[index].name ?? "",
                    style: TextStyle(
                      fontSize: 10.r,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
        ),
        child: Column(
          children: [
            Container(
              height: 46.h,
              width: 46.w,
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2EF),
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(widget.data.icon ?? ""),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              widget.data.name ?? "",
              style: TextStyle(fontSize: 10.r, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }
  }
}
