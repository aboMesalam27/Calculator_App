import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color colorWhite = Colors.white;
  Color colorBlack = Colors.black;
  Color colorOrangeAcent = Colors.orangeAccent;
  Color colorGreyBlack = const Color.fromRGBO(73, 74, 92, 1);
  String equation = "0";
  String result = "0";
  String expersion = "";
  double equationSize = 30.0;
  double resultSize = 50.0;
  pressedBut(val) {
    setState(() {
      if (val == "C") {
        equation = "0";
        result = "0";
        equationSize = 30.0;
        resultSize = 50.0;
      } else if (val == "⌫") {
        equationSize = 50.0;
        resultSize = 30.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (val == "=") {
        equationSize = 30.0;
        resultSize = 50.0;
        expersion = equation;
        expersion = expersion.replaceAll('x', '*');
        expersion = expersion.replaceAll('÷', '/');
        try {
          Parser p = new Parser();
          Expression xp = p.parse(expersion);
          ContextModel cm = ContextModel();
          result = '${xp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Invalid";
        }
      } else {
        equationSize = 50.0;
        resultSize = 30.0;
        if (equation == "0") {
          equation = val;
        } else {
          equation = equation + val;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget buildButton(String value, Color backgroundColor, colorText) {
      return Expanded(
        child: Container(
          margin:const EdgeInsets.all(10.0),
          child: RaisedButton(
              padding:const EdgeInsets.all(13),
              elevation: 10,
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                pressedBut(value);
              },
              child: Text(
                value,
                style: TextStyle(
                    color: colorText,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorWhite,
        title: Row(
          children: [
         
             Text(
              "Calculator",
              style: TextStyle(
                color: colorOrangeAcent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: Colors.orange.withOpacity(0.5)
                  )
                ),
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      equation,
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: equationSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    result,
                    style: TextStyle(
                      color: colorBlack,
                      fontSize: resultSize,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildButton("C", colorGreyBlack, colorWhite),
                buildButton("⌫", colorGreyBlack, colorWhite),
                buildButton("%", colorGreyBlack, colorWhite),
                buildButton("÷", colorOrangeAcent, colorWhite),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton("7", colorWhite, colorBlack),
                buildButton("8", colorWhite, colorBlack),
                buildButton("9", colorWhite, colorBlack),
                buildButton("x", colorOrangeAcent, colorWhite),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton("4", colorWhite, colorBlack),
                buildButton("5", colorWhite, colorBlack),
                buildButton("6", colorWhite, colorBlack),
                buildButton("+", colorOrangeAcent, colorWhite),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton("1", colorWhite, colorBlack),
                buildButton("2", colorWhite, colorBlack),
                buildButton("3", colorWhite, colorBlack),
                buildButton("-", colorOrangeAcent, colorWhite),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(".", colorWhite, colorBlack),
                buildButton("0", colorWhite, colorBlack),
                buildButton("00", colorWhite, colorBlack),
                buildButton("=", colorOrangeAcent, colorWhite),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
