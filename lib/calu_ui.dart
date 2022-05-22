// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';

class CalcUI extends StatefulWidget {
  const CalcUI({Key? key}) : super(key: key);

  @override
  State<CalcUI> createState() => _CalcUIState();
}

class _CalcUIState extends State<CalcUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5582AC),
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 350,
                  color: Color(0xFF5582AC),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getRaisedValueButton("/"),
              getRaisedValueButton("*"),
              getRaisedValueButton("C"),
              getImgButton(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getRaisedValueButton("7"),
                      getRaisedValueButton("8"),
                      getRaisedValueButton("9"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getRaisedValueButton("4"),
                      getRaisedValueButton("5"),
                      getRaisedValueButton("6"),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getPlusButton("+"),
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getRaisedValueButton("1"),
              getRaisedValueButton("2"),
              getRaisedValueButton("3"),
              getRaisedValueButton("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getRaisedValueButton("00"),
              getRaisedValueButton("0"),
              getRaisedValueButton("."),
              getRaisedValueButton("="),
            ],
          ),
        ],
      ),
    );
  }

  getRaisedValueButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          textColor: Colors.white,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          color: const Color(0xFF1E345D),
          onPressed: () {}),
    );
  }

  getImgButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          textColor: Colors.white,
          child: Image.asset(
            'assets/backspace.png',
            height: 40,
          ),
          color: const Color(0xFF1E345D),
          onPressed: () {}),
    );
  }

  getPlusButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            textColor: Colors.white,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            color: const Color(0xFF1E345D),
            onPressed: () {}),
      ),
    );
  }
}
