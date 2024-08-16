import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        brightness: Brightness.dark,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayText = '0'; // Initialize with '0'
  String _operation = '';
  double _num1 = 0;
  double _num2 = 0;
  String _result = '';
  String _expression = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '0'; // Reset to '0' on clear
        _operation = '';
        _num1 = 0;
        _num2 = 0;
        _result = '';
        _expression = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _num1 = double.parse(_displayText);
        _operation = buttonText;
        _displayText = '';
        _expression = '$_num1 $buttonText';
      } else if (buttonText == '=') {
        if (_displayText.isNotEmpty) {
          _num2 = double.parse(_displayText);
          double result;
          switch (_operation) {
            case '+':
              result = _num1 + _num2;
              break;
            case '-':
              result = _num1 - _num2;
              break;
            case '*':
              result = _num1 * _num2;
              break;
            case '/':
              result = _num1 / _num2;
              break;
            default:
              result = 0;
          }
          _expression = '$_expression $_num2 =';
          _result =
              (result % 1 == 0 ? result.toInt().toString() : result.toString());
          _displayText = _result;
          _operation = '';
          _num1 = 0;
          _num2 = 0;
        }
      } else {
        // Update displayText
        if (_displayText == '0') {
          _displayText = buttonText; // Replace '0' with the new digit
        } else {
          _displayText += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(60, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          shadowColor: Colors.black,
          elevation: 8,
          side: const BorderSide(color: Colors.black, width: 2),
        ).copyWith(
          elevation: ButtonStyleButton.allOrNull(8.0),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonClr(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(60, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          shadowColor: Colors.black,
          elevation: 8,
          side: const BorderSide(color: Colors.black, width: 2),
        ).copyWith(
          elevation: ButtonStyleButton.allOrNull(8.0),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "CALCULATOR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _displayText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              _buildButton('MC'),
              const SizedBox(width: 10),
              _buildButton('M+'),
              const SizedBox(width: 10),
              _buildButton('M-'),
              const SizedBox(width: 10),
              _buildButton('MR'),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              _buildButtonClr('C'),
              const SizedBox(width: 10),
              _buildButtonClr('+/-'),
              const SizedBox(width: 10),
              _buildButtonClr('/'),
              const SizedBox(width: 10),
              _buildButtonClr('*'),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              _buildButton('7'),
              const SizedBox(width: 10),
              _buildButton('8'),
              const SizedBox(width: 10),
              _buildButton('9'),
              const SizedBox(width: 10),
              _buildButtonClr('-'),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              _buildButton('4'),
              const SizedBox(width: 10),
              _buildButton('5'),
              const SizedBox(width: 10),
              _buildButton('6'),
              const SizedBox(width: 10),
              _buildButtonClr('+'),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              _buildButton('1'),
              const SizedBox(width: 10),
              _buildButton('2'),
              const SizedBox(width: 10),
              _buildButton('3'),
              const SizedBox(
                width: 10,
              ),
              _buildButtonClr('='),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const SizedBox(width: 10, height: 10),
              _buildButton('0'),
              const SizedBox(width: 10),
              _buildButton('.'),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
