import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const BottomButton({super.key, required this.buttonText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 36.h,
      left: 26.w,
      right: 26.w,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        height: 46.h,
        color: Color(0xff2965FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(23.r)),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
