import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFF5582AC)),
        ),
        home: Calc());
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    ;
    return MaterialColor(color.value, swatch);
  }
}

class Calc extends StatefulWidget {
  Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  var question = '';
  var answer = '';

  final List<String> button = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5582AC),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      question,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: button.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Button(
                            buttonTap: () {
                              setState(() {
                                question = '';
                              });
                            },
                            buttonText: button[index],
                            color: Colors.green,
                            textColor: Colors.white,
                          );
                        } else if (index == 1) {
                          return Button(
                            buttonTap: () {
                              setState(() {
                                question =
                                    question.substring(0, question.length - 1);
                              });
                            },
                            buttonText: button[index],
                            color: Colors.red,
                            textColor: Colors.white,
                          );
                        } else if (index == button.length - 1) {
                          return Button(
                            buttonTap: () {
                              setState(() {
                                isEqualPressed();
                              });
                            },
                            buttonText: button[index],
                            color: Colors.red,
                            textColor: Colors.white,
                          );
                        } else {
                          return Button(
                            buttonTap: () {
                              setState(() {
                                question += button[index];
                              });
                            },
                            buttonText: button[index],
                            color: isOperator(button[index])
                                ? Colors.blue[900]
                                : Colors.white,
                            textColor: isOperator(button[index])
                                ? Colors.white
                                : Colors.blue[900],
                          );
                        }
                      }))),
        ],
      ),
    );
  }

  bool isOperator(String operator) {
    if (operator == '+' ||
        operator == '-' ||
        operator == 'x' ||
        operator == '/' ||
        operator == '=' ||
        operator == '%') {
      return true;
    } else {
      return false;
    }
  }

  isEqualPressed() {
    String userQuestion = question;
    Parser p = Parser();
    Expression exp = p.parse(userQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }
}
