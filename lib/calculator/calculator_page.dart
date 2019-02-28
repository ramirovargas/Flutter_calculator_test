import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator/calculator_bloc.dart';

class CalculatorPage extends StatefulWidget {
  final CalculatorBloc bloc;

  CalculatorPage({@required this.bloc});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  _onTap(Operators operator) {
    widget.bloc.onTapOperator(operator);
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(49, 56, 67, 1),
            child: Align(
              child: StreamBuilder(
                  stream: widget.bloc.stream,
                  initialData: widget.bloc.stream.value,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    return Text(
                      "${data ?? "0"}",
                      key: Key("text_result"),
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 50),
                      textAlign: TextAlign.end,
                    );
                  }),
              alignment: Alignment.bottomRight,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            ButtonWidget(
              buttonColor: Colors.grey[700],
              buttonText: "AC",
              key: Key("button_ac"),
              onTap: () => _onTap(Operators.AC),
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonColor: Colors.grey[700],
              buttonText: "+/-",
              key: Key("button_plus_minus"),
              onTap: () => _onTap(Operators.PLUS_MINUS),
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonColor: Colors.grey[700],
              buttonText: "%",
              key: Key("button_percentage"),
              onTap: () => _onTap(Operators.PERCENTAGE),
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonColor: Colors.orange,
              buttonText: "/",
              key: Key("button_divide"),
              onTap: () => _onTap(Operators.DIVIDE),
            ),
          ],
        ),
        HorizontalButtonDivider(),
        Row(
          children: <Widget>[
            ButtonWidget(
              buttonText: "7",
              key: Key("button_7"),
              onTap: () {
                widget.bloc.input.add("7");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonText: "8",
              key: Key("button_8"),
              onTap: () {
                widget.bloc.input.add("8");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonText: "9",
              key: Key("button_9"),
              onTap: () {
                widget.bloc.input.add("9");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonColor: Colors.orange,
              buttonText: "x",
              key: Key("button_multiply"),
              onTap: () => _onTap(Operators.MULTIPLY),
            ),
          ],
        ),
        HorizontalButtonDivider(),
        Row(
          children: <Widget>[
            ButtonWidget(
              buttonText: "4",
              key: Key("button_4"),
              onTap: () {
                widget.bloc.input.add("4");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonText: "5",
              key: Key("button_5"),
              onTap: () {
                widget.bloc.input.add("5");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonText: "6",
              key: Key("button_6"),
              onTap: () {
                widget.bloc.input.add("6");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonColor: Colors.orange,
              buttonText: "-",
              key: Key("button_subtract"),
              onTap: () => _onTap(Operators.SUBTRACT),
            ),
          ],
        ),
        HorizontalButtonDivider(),
        Row(
          children: <Widget>[
            ButtonWidget(
              buttonText: "1",
              key: Key("button_1"),
              onTap: () {
                widget.bloc.input.add("1");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonText: "2",
              key: Key("button_2"),
              onTap: () {
                widget.bloc.input.add("2");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonText: "3",
              key: Key("button_3"),
              onTap: () {
                widget.bloc.input.add("3");
              },
            ),
            ButtonDivider(),
            ButtonWidget(
              buttonColor: Colors.orange,
              buttonText: "+",
              key: Key("button_add"),
              onTap: () => _onTap(Operators.ADD),
            ),
          ],
        ),
        HorizontalButtonDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ButtonWidget(
              buttonText: "0",
              key: Key("button_0"),
              onTap: () {
                widget.bloc.input.add("0");
              },
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  ButtonDivider(),
                  ButtonWidget(
                    buttonText: ".",
                    key: Key("button_dot"),
                    onTap: () {
                      widget.bloc.input.add(".");
                    },
                  ),
                  ButtonDivider(),
                  ButtonWidget(
                    buttonColor: Colors.orange,
                    key: Key("button_equals"),
                    buttonText: "=",
                    onTap: () => _onTap(Operators.EQUALS),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ButtonDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 80,
      color: Colors.grey[800],
    );
  }
}

class HorizontalButtonDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[800],
    );
  }
}

class ButtonWidget extends StatefulWidget {
  final Color buttonColor;
  final String buttonText;
  final VoidCallback onTap;
  final Key key;

  ButtonWidget({this.key, this.buttonColor, this.buttonText, this.onTap})
      : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: widget.onTap,
        fillColor: widget.buttonColor ?? Colors.grey,
        child: Container(
          width: 80,
          height: 80,
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
