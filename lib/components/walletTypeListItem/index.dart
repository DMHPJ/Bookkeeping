import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
            height: 200.h,
            padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
            child: Row(
              children: [
                Container(
                  height: 160.h,
                  width: 160.w,
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBE6),
                    borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  ),
                  child: GetSvg.url(widget.data.icon ?? ""),
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
                            widget.data.name ?? "",
                            style: TextStyle(
                              fontSize: 40.r,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        transform: Matrix4.translationValues(60.w, 0, 0),
                        child: Icon(
                          Icons.more_horiz,
                          size: 50.r,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
