import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithIcon extends StatelessWidget {
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final String? icon;
  final double? iconSize;
  final double? marginBottom;
  const TitleWithIcon({
    super.key,
    required this.title,
    this.titleSize,
    this.titleColor = const Color(0xFF333333),
    this.icon = "basic/title",
    this.iconSize,
    this.marginBottom = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: iconSize ?? 20.r, child: GetSvg.url(icon!)),
        SizedBox(width: 4.w),
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? 14.r,
            color: titleColor,
          ),
        ),
      ],
    );
  }
}
