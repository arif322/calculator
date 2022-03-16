import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String oparend = " ";

  buttonPresed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      oparend = " ";
    } else if (buttonText == "/" ||
        buttonText == "*" ||
        buttonText == "-" ||
        buttonText == "+") {
      num1 = double.parse(output);
      oparend = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("decimal already used");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (oparend == "+") {
        _output = (num1 + num2).toString();
      }
      if (oparend == "-") {
        _output = (num1 - num2).toString();
      }
      if (oparend == "*") {
        _output = (num1 * num2).toString();
      }
      if (oparend == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      oparend = " ";
    } else {
      _output = _output + buttonText;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buttonPage(String buttonStyle) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          buttonPresed(buttonStyle);
        },
        child: Text(
          '$buttonStyle',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
                child: Text(output,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
              ),
              const Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      buttonPage("7"),
                      buttonPage("8"),
                      buttonPage("9"),
                      buttonPage("/")
                    ],
                  ),
                  Row(
                    children: [
                      buttonPage("4"),
                      buttonPage("5"),
                      buttonPage("6"),
                      buttonPage("*")
                    ],
                  ),
                  Row(
                    children: [
                      buttonPage("1"),
                      buttonPage("2"),
                      buttonPage("3"),
                      buttonPage("-")
                    ],
                  ),
                  Row(
                    children: [
                      buttonPage("."),
                      buttonPage("0"),
                      buttonPage("#"),
                    ],
                  ),
                  Row(
                    children: [buttonPage("CLEAR"), buttonPage("=")],
                  )
                ],
              )
            ]),
      ),
    );
  }
}
