import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Modifier {
  String modify(String value) => value * 2;
}

void main() {
  runApp(CalculatorApp(modifier: Modifier()));
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({required this.modifier});
  final Modifier modifier;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TestedTexts(modifier: modifier),
              Container(color: Colors.red, width: 100, height: 100),
              // StreamTest(),
              TwoDigitOperation(),
              TwoDigitOperation(),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: Stream.fromIterable(['1', '2', '3']).interval(500.milliseconds),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        print(snapshot);
        return snapshot.hasData ? Text(snapshot.data!, textScaleFactor: 5) : CircularProgressIndicator();
        // return Text(snapshot.data!);
      },
    );
  }
}

class TestedTexts extends StatefulWidget {
  const TestedTexts({required this.modifier});
  final Modifier modifier;
  @override
  TestedTextsState createState() => TestedTextsState();
}

class TestedTextsState extends State<TestedTexts> {
  static const textFieldKey = Key('TextFieldKey');
  static const textKey = Key('TextKey');
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(key: textFieldKey, onChanged: (value) => setState(() => text = widget.modifier.modify(value))),
        Text(text, key: textKey),
      ],
    );
  }
}

class TwoDigitOperation extends StatelessWidget {
  const TwoDigitOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
