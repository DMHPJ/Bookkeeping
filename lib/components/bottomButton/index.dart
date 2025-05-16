import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const BottomButton({super.key, required this.buttonText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60.h,
      left: 80.w,
      right: 80.w,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        height: 110.h,
        color: Color(0xffAFC8DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 40.r, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
