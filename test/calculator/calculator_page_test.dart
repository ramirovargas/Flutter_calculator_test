import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator/calculator_bloc.dart';
import 'package:flutter_calculator/calculator/calculator_page.dart';
import 'package:flutter_test/flutter_test.dart';

const AC_BUTTON = Key("button_ac");
const PLUS_MINUS_BUTTON = Key("button_plus_minus");
const PERCENTAGE_BUTTON = Key("button_percentage");
const DIVIDE_BUTTON = Key("button_divide");
const MULTIPLY_BUTTON = Key("button_multiply");
const ADD_BUTTON = Key("button_add");
const SUBTRACT_BUTTON = Key("button_subtract");
const DOT_BUTTON = Key("button_dot");
const EQUALS_BUTTON = Key("button_equals");
const BUTTON_0 = Key("button_0");
const BUTTON_1 = Key("button_1");
const BUTTON_2 = Key("button_2");
const BUTTON_3 = Key("button_3");
const BUTTON_4 = Key("button_4");
const BUTTON_5 = Key("button_5");
const BUTTON_6 = Key("button_6");
const BUTTON_7 = Key("button_7");
const BUTTON_8 = Key("button_8");
const BUTTON_9 = Key("button_9");
const TEXT_RESULT = Key("text_result");

void main() {
  testWidgets('Test sum', (WidgetTester tester) async {
    final bloc = CalculatorBloc();
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, stateSetter) => MaterialApp(
              home: CalculatorPage(
                bloc: bloc,
              ),
            ),
      ),
    );

    await tester.tap(find.byKey(BUTTON_1));
    await tester.tap(find.byKey(ADD_BUTTON));
    await tester.tap(find.byKey(BUTTON_2));
    await tester.tap(find.byKey(DOT_BUTTON));
    await tester.tap(find.byKey(BUTTON_5));
    await tester.tap(find.byKey(EQUALS_BUTTON));
    await tester.pump();

    final Text textWidget = tester.firstWidget(find.byKey(TEXT_RESULT));

    expect(textWidget.data == "3.5", true);
  });

  testWidgets('Test subtract', (WidgetTester tester) async {
    final bloc = CalculatorBloc();
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, stateSetter) => MaterialApp(
              home: CalculatorPage(
                bloc: bloc,
              ),
            ),
      ),
    );

    await tester.tap(find.byKey(BUTTON_9));
    await tester.tap(find.byKey(SUBTRACT_BUTTON));
    await tester.tap(find.byKey(BUTTON_7));
    await tester.tap(find.byKey(EQUALS_BUTTON));
    await tester.pump();

    final Text textWidget = tester.firstWidget(find.byKey(TEXT_RESULT));

    expect(textWidget.data == "2", true);
  });

  //TODO
  testWidgets('Test mult', (WidgetTester tester) async {
    final bloc = CalculatorBloc();
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, stateSetter) => MaterialApp(
              home: CalculatorPage(
                bloc: bloc,
              ),
            ),
      ),
    );
    await tester.tap(find.byKey(BUTTON_9));
    await tester.tap(find.byKey(MULTIPLY_BUTTON));
    await tester.tap(find.byKey(BUTTON_7));
    await tester.tap(find.byKey(EQUALS_BUTTON));
    await tester.pump();

    final Text textWidget = tester.firstWidget(find.byKey(TEXT_RESULT));

    expect(textWidget.data == "63", true);


  });

  //TODO
  testWidgets('Test div', (WidgetTester tester) async {
    final bloc = CalculatorBloc();
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, stateSetter) => MaterialApp(
              home: CalculatorPage(
                bloc: bloc,
              ),
            ),
      ),
    );
    await tester.tap(find.byKey(BUTTON_8));
    await tester.tap(find.byKey(DIVIDE_BUTTON));
    await tester.tap(find.byKey(BUTTON_2));
    await tester.tap(find.byKey(EQUALS_BUTTON));
    await tester.pump();

    final Text textWidget = tester.firstWidget(find.byKey(TEXT_RESULT));

    expect(textWidget.data == "4", true);


  });

  //TODO
  testWidgets('Test percentage', (WidgetTester tester) async {
    final bloc = CalculatorBloc();
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, stateSetter) => MaterialApp(
          home: CalculatorPage(
            bloc: bloc,
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(BUTTON_8));
    await tester.tap(find.byKey(PERCENTAGE_BUTTON));
    await tester.tap(find.byKey(EQUALS_BUTTON));
    await tester.pump();

    final Text textWidget = tester.firstWidget(find.byKey(TEXT_RESULT));

    expect(textWidget.data == "0.08", true);
  });


}
