import 'package:flutter/material.dart';
import 'package:flutter_class/widget_file/build_button.dart';

class SumApp extends StatefulWidget {
  const SumApp({super.key});

  @override
  State<SumApp> createState() => _SumAppState();
}

class _SumAppState extends State<SumApp> {
  String outPut = "0";
  String? result;
  String inPut = "";
  String operEnd = "";
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value) {
    setState(() {
      if (value == "AC" || value == "<-") {
        outPut = "0";
        inPut = " ";
        operEnd = " ";
        result = null;
        num1 = 0;
        num2 = 0;
      } else if (value == "=") {
        num2 = double.parse(inPut);
        if (operEnd == "+") {
          outPut = (num1 + num2).toString();
        } else if (operEnd == "-") {
          outPut = (num1 - num2).toString();
        } else if (operEnd == "x") {
          outPut = (num1 * num2).toString();
        } else if (operEnd == "/") {
          outPut = (num1 / num2).toString();
        } else if (operEnd == "%") {
          // ignore: unrelated_type_equality_checks
          outPut = (num2 != "0") ? (num1 % num2).toString() : "Eror";
        }
        inPut = outPut;
      } else if (["+", "-", "x", "/"].contains(value)) {
        num1 = double.parse(inPut);
        operEnd = value;
        result = inPut + operEnd;
        inPut = " ";
      } else {
        inPut += value;
        outPut = inPut;
        result = outPut;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Sum app"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 70,
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    result ?? "",
                    style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  height: 70,
                  color: Colors.amber,
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    outPut,
                    style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              BuildButton(
                text: 'AC',
                onClick: () {
                  buttonPress('AC');
                },
              ),
              BuildButton(
                text: '%',
                onClick: () {
                  buttonPress('%');
                },
              ),
              BuildButton(
                text: '<-',
                onClick: () {
                  buttonPress('<-');
                },
              ),
              BuildButton(
                text: '/',
                onClick: () {
                  buttonPress('/');
                },
              ),
            ],
          ),
          Row(
            children: [
              BuildButton(
                text: '7',
                onClick: () {
                  buttonPress('7');
                },
              ),
              BuildButton(
                text: '8',
                onClick: () {
                  buttonPress('8');
                },
              ),
              BuildButton(
                text: '9',
                onClick: () {
                  buttonPress('9');
                },
              ),
              BuildButton(
                text: 'x',
                onClick: () {
                  buttonPress('x');
                },
              ),
            ],
          ),
          Row(
            children: [
              BuildButton(
                text: '4',
                onClick: () {
                  buttonPress('4');
                },
              ),
              BuildButton(
                text: '5',
                onClick: () {
                  buttonPress('5');
                },
              ),
              BuildButton(
                text: '6',
                onClick: () {
                  buttonPress('6');
                },
              ),
              BuildButton(
                text: '-',
                onClick: () {
                  buttonPress('-');
                },
              ),
            ],
          ),
          Row(
            children: [
              BuildButton(
                text: '1',
                onClick: () {
                  buttonPress('1');
                },
              ),
              BuildButton(
                text: '2',
                onClick: () {
                  buttonPress('2');
                },
              ),
              BuildButton(
                text: '3',
                onClick: () {
                  buttonPress('3');
                },
              ),
              BuildButton(
                text: '+',
                onClick: () {
                  buttonPress('+');
                },
              ),
            ],
          ),
          Row(
            children: [
              BuildButton(
                text: '00',
                onClick: () {
                  buttonPress('00');
                },
              ),
              BuildButton(
                text: '0',
                onClick: () {
                  buttonPress('0');
                },
              ),
              BuildButton(
                text: '.',
                onClick: () {
                  buttonPress('.');
                },
              ),
              BuildButton(
                text: '=',
                color: Colors.amber,
                onClick: () {
                  buttonPress('=');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
