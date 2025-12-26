import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_application_1/theme/app_colors.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class BillTypeListItemIcon extends StatefulWidget {
  final BillTypeItemData data;
  final String? activeParentId;
  final Function(String parentId, BillTypeItemData subItem) onSelect;

  const BillTypeListItemIcon({
    super.key,
    required this.data,
    required this.activeParentId,
    required this.onSelect,
  });

  @override
  State<StatefulWidget> createState() {
    return _BillTypeListItemIconState();
  }
}

class _BillTypeListItemIconState extends State<BillTypeListItemIcon> {
  var logger = Logger();
  String? _currentIcon;
  String? _selectedId;
  String? _currentName;

  @override
  void initState() {
    super.initState();
    _resetState();
  }
  
  void _resetState() {
    _currentIcon = widget.data.icon;
    _currentName = widget.data.name;
    _selectedId = null;
  }

  @override
  void didUpdateWidget(BillTypeListItemIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 数据变更或 activeParentId 变更且不等于自己时，重置状态
    if (oldWidget.data != widget.data || 
        (widget.activeParentId != widget.data.id && widget.activeParentId != null)) {
      if (widget.activeParentId != widget.data.id) {
        _resetState();
      }
    }
  }

  void _onSubItemSelected(BillTypeItemData item) {
    setState(() {
      _currentIcon = item.icon;
      _selectedId = item.id;
      _currentName = "${widget.data.name} - ${item.name}";
    });
    
    // 通知父组件
    widget.onSelect(widget.data.id ?? "", item);

    // 尝试关闭 Popup
    Navigator.of(context).pop();
  }

  Widget _buildIconContainer({bool isSelected = false}) {
    return Container(
      height: 46.h,
      width: 46.w,
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLight : AppColors.iconBackgroundLight,
        borderRadius: BorderRadius.all(Radius.circular(10.r)), // Rounded for relief
        border: isSelected
            ? Border.all(color: AppColors.primary, width: 1.r)
            : Border.all(color: Colors.transparent, width: 1.r),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.shadowBlueLight,
                  offset: Offset(0, 4.h),
                  blurRadius: 8.r,
                  spreadRadius: 0,
                ),
              ]
            : [],
      ),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Text(_currentIcon ?? ""),
          ),
          if (widget.data.children?.isNotEmpty ?? false)
            Positioned(
              bottom: -6.r,
              right: -6.r,
              child: Container(
                width: 14.r,
                height: 14.r,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.more_horiz,
                  size: 10.r,
                  color: AppColors.textGray,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isParentSelected = widget.activeParentId == widget.data.id;

    if (widget.data.children!.isEmpty) {
      // 没有子项时，点击直接选中自己，并通知重置其他项
      return GestureDetector(
        onTap: () {
          widget.onSelect(widget.data.id ?? "", widget.data);
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            _buildIconContainer(isSelected: isParentSelected),
            SizedBox(height: 4.h),
            Text(
              widget.data.name ?? "",
              style: TextStyle(
                fontSize: 10.r, 
                fontWeight: isParentSelected ? FontWeight.w600 : FontWeight.w400,
                color: isParentSelected ? AppColors.primary : AppColors.black,
              ),
            ),
          ],
        ),
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
          itemBuilder: (context, index) {
            final item = widget.data.children![index];
            final isSubSelected = item.id == _selectedId;
            
            return GestureDetector(
              onTap: () => _onSubItemSelected(item),
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  Container(
                    height: 46.h,
                    width: 46.w,
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: isSubSelected
                          ? AppColors.primaryLight
                          : AppColors.iconBackgroundLight,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      border: isSubSelected
                          ? Border.all(color: AppColors.primary, width: 1.r)
                          : Border.all(color: Colors.transparent, width: 1.r),
                      boxShadow: isSubSelected
                          ? [
                              BoxShadow(
                                color: AppColors.shadowBlueLight,
                                offset: Offset(0, 4.h),
                                blurRadius: 8.r,
                                spreadRadius: 0,
                              ),
                            ]
                          : [],
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(item.icon ?? ""),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.name ?? "",
                    style: TextStyle(
                      fontSize: 10.r,
                      fontWeight:
                          isSubSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSubSelected
                          ? AppColors.primary
                          : AppColors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        child: Column(
          children: [
            _buildIconContainer(isSelected: isParentSelected),
            SizedBox(height: 4.h),
            Text(
              _currentName ?? "",
              style: TextStyle(
                fontSize: 10.r, 
                fontWeight: isParentSelected ? FontWeight.w600 : FontWeight.w400,
                color: isParentSelected ? AppColors.primary : AppColors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }
  }
}
