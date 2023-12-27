import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  pressedButton(String val) {

    if (val == "C") {
      _out = "0";
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (val == '+' || val == "-" || val == "*" || val == "/") {
      num1 = double.parse(output);
      operand = val;
      _out = "0";
      output = output + val;
    } else if (val == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + val;
      }
    } else if (val == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num1 + num2).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }
      if (operand == "*") {
        _out = (num1 * num2).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      num2 = 0.0;
      num1 = 0.0;
    } else {
      _out = _out + val;
    }
    setState(() {
      output = double.parse(_out).toStringAsFixed(1);
    });
  }

  Widget calcBtn(String btnval) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: const Offset(2.0, 2.0),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-1.0, -1.0),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            pressedButton(btnval);
          },
          padding: const EdgeInsets.all(23.0),
          child: Text(
            btnval,
            style: const TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      calcBtn("."),
                      calcBtn("C"),
                      calcBtn("<-"),
                      calcBtn("*"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("7"),
                      calcBtn("8"),
                      calcBtn("9"),
                      calcBtn("/"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("4"),
                      calcBtn("5"),
                      calcBtn("6"),
                      calcBtn("+"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("1"),
                      calcBtn("2"),
                      calcBtn("3"),
                      calcBtn("-"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("0"),
                      calcBtn("="),
                    ],
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
