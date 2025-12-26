import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Calculator extends StatefulWidget {
  final Function(double)? onSave;
  final Function(double)? onSaveAndNew;

  const Calculator({super.key, this.onSave, this.onSaveAndNew});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayValue = '0.00';
  String _currentInput = '';
  double _result = 0.0;
  String _operator = '';
  double _previousValue = 0.0;
  String _remark = '';
  bool _showingExpression = false;

  void _onNumberPress(String number) {
    setState(() {
      // 检查小数点后是否已有两位数字
      if (_currentInput.contains('.')) {
        int dotIndex = _currentInput.indexOf('.');
        int decimalPlaces = _currentInput.length - dotIndex - 1;
        if (decimalPlaces >= 2 && number != '.') {
          // 显示提示
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('小数点后最多只能输入两位数字'),
              duration: Duration(milliseconds: 1500),
              behavior: SnackBarBehavior.floating,
            ),
          );
          return;
        }
      }

      if (_currentInput == '0' && number != '.') {
        _currentInput = number;
      } else if (number == '.' && _currentInput.contains('.')) {
        return;
      } else if (_currentInput.length < 10) {
        _currentInput += number;
      }
      _updateDisplayWithExpression();
    });
  }

  void _onOperatorPress(String op) {
    setState(() {
      if (_currentInput.isNotEmpty) {
        if (_operator.isEmpty) {
          _previousValue = double.tryParse(_currentInput) ?? 0.0;
        } else {
          _calculate();
          _previousValue = _result;
        }
        _operator = op;
        _currentInput = '';
        _showingExpression = true;
        _updateDisplayWithExpression();
      }
    });
  }

  void _calculate() {
    double currentValue = double.tryParse(_currentInput) ?? 0.0;

    if (_operator.isEmpty) {
      _result = currentValue;
    } else {
      switch (_operator) {
        case '+':
          _result = _previousValue + currentValue;
          break;
        case '-':
          _result = _previousValue - currentValue;
          break;
        default:
          _result = currentValue;
      }
    }
    _updateDisplay();
  }

  void _updateDisplay() {
    if (_currentInput.isNotEmpty) {
      _displayValue = _currentInput;
    } else {
      _displayValue = _result.toStringAsFixed(2);
    }
  }

  void _updateDisplayWithExpression() {
    if (_operator.isNotEmpty && _showingExpression) {
      String prevValue = _previousValue.toString();
      if (_previousValue == _previousValue.toInt()) {
        prevValue = _previousValue.toInt().toString();
      }
      _displayValue = '$prevValue$_operator${_currentInput}';
    } else if (_currentInput.isNotEmpty) {
      _displayValue = _currentInput;
    } else {
      _displayValue = _result.toStringAsFixed(2);
    }
  }

  void _onBackspace() {
    setState(() {
      if (_showingExpression) {
        // 如果正在显示表达式
        if (_currentInput.isNotEmpty) {
          // 如果有第二个数字，删除第二个数字
          _currentInput = _currentInput.substring(0, _currentInput.length - 1);
          _updateDisplayWithExpression();
        } else {
          // 如果没有第二个数字，删除运算符
          _operator = '';
          _showingExpression = false;
          _currentInput = _previousValue.toString();
          if (_previousValue == _previousValue.toInt()) {
            _currentInput = _previousValue.toInt().toString();
          }
          _updateDisplayWithExpression();
        }
      } else {
        // 普通删除逻辑
        if (_currentInput.isNotEmpty && _currentInput != '0') {
          _currentInput = _currentInput.substring(0, _currentInput.length - 1);
          if (_currentInput.isEmpty ||
              _currentInput == '' ||
              _currentInput == '-') {
            _currentInput = '0';
          }
          _updateDisplayWithExpression();
        } else if (_displayValue.contains('.')) {
          // 如果显示的是小数格式的结果（如100.00）
          String temp = _displayValue.substring(0, _displayValue.length - 1);
          if (temp.endsWith('.')) {
            temp = temp.substring(0, temp.length - 1);
          }
          _currentInput = temp;
          _result = double.tryParse(_currentInput) ?? 0.0;
          _updateDisplayWithExpression();
        }
      }
    });
  }

  void _onSave() {
    if (_showingExpression) {
      // 如果正在显示表达式，点击等于号计算结果
      if (_currentInput.isEmpty) {
        // 如果没有输入第二个数字（如100-），按照100-0处理
        _currentInput = '0';
      }
      _calculate();
      setState(() {
        _showingExpression = false;
        _operator = '';
        _currentInput = _result.toStringAsFixed(2);
        _displayValue = _result.toStringAsFixed(2);
      });
    } else {
      // 否则保存
      if (_currentInput.isNotEmpty) {
        _result = double.tryParse(_currentInput) ?? 0.0;
      }
      if (widget.onSave != null) {
        widget.onSave!(_result);
      }
    }
  }

  void _onSaveAndNew() {
    _calculate();
    if (widget.onSaveAndNew != null) {
      widget.onSaveAndNew!(_result);
    }
    _reset();
  }

  void _reset() {
    setState(() {
      _displayValue = '0.00';
      _currentInput = '';
      _result = 0.0;
      _operator = '';
      _previousValue = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(41, 101, 255, 0.06),
            offset: Offset(0.r, 0.r),
            spreadRadius: 4.r,
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 14.h),
            padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "添加备注",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontSize: 14.r,
                      ),
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    style: TextStyle(fontSize: 14.r),
                    onChanged: (value) {
                      _remark = value;
                    },
                  ),
                ),
                Text(
                  "￥ $_displayValue",
                  style: TextStyle(
                    color: Color(0xFFFF2B2F),
                    fontSize: 20.r,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 1.67,
            padding: EdgeInsets.zero,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              CalculatorButton(
                onPressed: () => _onNumberPress('7'),
                child: CalculatorButtonText(text: "7"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('8'),
                child: CalculatorButtonText(text: "8"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('9'),
                child: CalculatorButtonText(text: "9"),
              ),
              CalculatorButton(
                onPressed: _onBackspace,
                child: GetSvg.url(
                  "calculator/backspace",
                  props: BasicSvgProps(width: 28.r),
                ),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('4'),
                child: CalculatorButtonText(text: "4"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('5'),
                child: CalculatorButtonText(text: "5"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('6'),
                child: CalculatorButtonText(text: "6"),
              ),
              CalculatorButton(
                onPressed: () => _onOperatorPress('+'),
                child: CalculatorButtonText(text: "+"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('1'),
                child: CalculatorButtonText(text: "1"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('2'),
                child: CalculatorButtonText(text: "2"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('3'),
                child: CalculatorButtonText(text: "3"),
              ),
              CalculatorButton(
                onPressed: () => _onOperatorPress('-'),
                child: CalculatorButtonText(text: "-"),
              ),
              CalculatorButton(
                onPressed: _onSaveAndNew,
                child: CalculatorButtonText(text: "再记"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('0'),
                child: CalculatorButtonText(text: "0"),
              ),
              CalculatorButton(
                onPressed: () => _onNumberPress('.'),
                child: CalculatorButtonText(text: "."),
              ),
              CalculatorButton(
                onPressed: _onSave,
                child: CalculatorButtonText(
                  text: _showingExpression ? "=" : "保存",
                ),
              ),
            ],
          ),
          // 底部安全高度
          SizedBox(height: bottomPadding > 0 ? bottomPadding : 16.h),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const CalculatorButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r)),
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFF2965FF),
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class CalculatorButtonText extends StatelessWidget {
  final String text;
  const CalculatorButtonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 16.r));
  }
}
