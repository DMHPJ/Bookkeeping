import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class BillTypeListItem extends StatefulWidget {
  final BillTypeItemData data;
  final Function(BillTypeItemData data) navigateToAddEdit;
  const BillTypeListItem({super.key, required this.data, required this.navigateToAddEdit});

  @override
  State<StatefulWidget> createState() {
    return _BillTypeListItemState();
  }
}

class _BillTypeListItemState extends State<BillTypeListItem> {
  var logger = Logger();
  bool _isExpanded = false;
  late BillTypeItemData _baseData;

  void toSelectedItem(int index) {
    final isEdit = (index + 1) <= (widget.data.children?.length ?? 0);
    widget.navigateToAddEdit(isEdit ? (widget.data.children![index]) : _baseData);
  }

  @override
  void initState() {
    super.initState();
    _baseData = BillTypeItemData(
      parentId: widget.data.id,
      parentName: widget.data.name,
      parentIcon: widget.data.icon,
    );
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
        child: ExpansionTile(
          leading: Icon(
            _isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
            size: 55.r,
            color: Colors.grey.shade500,
          ),
          trailing: SizedBox.shrink(),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          title: Container(
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
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(widget.data.icon ?? ""),
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
          children: [
            Container(
              // decoration: BoxDecoration(
              //   color: Colors.red,
              // ),
              padding: EdgeInsets.only(left: 60.w, right: 60.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "子分类更改或删除请点击对应子分类图标",
                    style: TextStyle(
                      fontSize: 34.r,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: (widget.data.children?.length ?? 0) + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, // 列数
                      mainAxisSpacing: 10.h, // 主轴间距
                      crossAxisSpacing: 40.w, // 次轴间距
                      childAspectRatio: 0.65, // 宽高比例
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () => toSelectedItem(index), // 添加按钮点击事件
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              side: BorderSide.none,
                              backgroundColor:
                                  Colors.deepOrange.shade50, // 背景颜色
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.r), // 圆角
                              ),
                              padding: EdgeInsets.all(0),
                            ),
                            child: Container(
                              height: 160.h,
                              width: 160.w,
                              padding: EdgeInsets.all(20.r),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEBE6),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.r),
                                ),
                              ),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child:
                                    (index + 1) <=
                                            (widget.data.children?.length ?? 0)
                                        ? Text(
                                          widget.data.children?[index].icon ??
                                              "",
                                        )
                                        : Icon(
                                          Icons.add_circle_outline_rounded,
                                        ),
                              ),
                            ),
                          ),
                          Text(
                            (index + 1) <= (widget.data.children?.length ?? 0)
                                ? (widget.data.children?[index].name ?? "")
                                : "添加子分类",
                            style: TextStyle(
                              fontSize: 30.r,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
