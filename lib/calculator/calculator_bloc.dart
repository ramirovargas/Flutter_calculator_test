import 'package:rxdart/rxdart.dart';

class CalculatorBloc {
  final ValueObservable<String> stream;
  final BehaviorSubject<String> _subject;
  final PublishSubject<String> input;
  double lastResult = 0;
  double currentVal;
  Operators lastOperator;
  bool onNewNumber = false;

  factory CalculatorBloc() {
    return CalculatorBloc._(
        subject: BehaviorSubject<String>(),
        inputSubject: PublishSubject<String>())
      .._starListeningNumbers();
  }

  CalculatorBloc._(
      {BehaviorSubject<String> subject, PublishSubject<String> inputSubject})
      : _subject = subject,
        input = inputSubject,
        stream = subject.stream;

  _starListeningNumbers() {
    input.listen((num) {
      _addNumber(num);
    });
  }

  _addNumber(String num) {
    if (onNewNumber) {
      onNewNumber = false;
      _subject.value = null;
    }
    final lastString = _subject.value;
    lastString == null
        ? _subject.add(num != "0" ? num : null)
        : _subject.add((num == "0" && lastString == "0" ? "" : lastString) +
            (num == "." && lastString.contains(".") ? "" : num));
  }

  onTapOperator(Operators operator) {
    if (operator == Operators.AC) {
      lastResult = 0;
      currentVal = null;
      lastOperator = null;

      _printResult();
      _subject.add(null);
    } else if (operator == Operators.PLUS_MINUS) {
      lastResult = _covertVal();
      lastResult *= -1;
      _printResult();
    } else if (operator == Operators.PERCENTAGE) {
      lastResult = _covertVal();
      lastResult /= 100;
      _printResult();
    } else {
      if (lastOperator == null) {
        lastResult = _covertVal();
        onNewNumber = true;
        lastOperator = operator;
      } else if (!onNewNumber) {
        currentVal = _covertVal();
        _operate();
      }
    }
  }

  double _covertVal() {
    try {
      return double.parse(_subject.value);
    } catch (e) {
      _subject.add("!ERROR");
      return null;
    }
  }

  _operate() {
    switch (lastOperator) {
      case Operators.ADD:
        {
          lastResult += currentVal;
          _printResult();
          break;
        }
      case Operators.SUBTRACT:
        {
          lastResult -= currentVal;
          _printResult();
          break;
        }
      case Operators.MULTIPLY:
        {
          lastResult *= currentVal;
          _printResult();
          break;
        }
      case Operators.DIVIDE:
        {
          try {
            lastResult /= currentVal;
          } on Exception {
            _subject.add("!ERROR");
          }
          _printResult();
          break;
        }
    }
    lastOperator = null;
    currentVal = null;
  }

  _printResult() {
    lastResult % 1 != 0
        ? _subject.add(lastResult.toString())
        : _subject.add(lastResult.toStringAsFixed(0));
  }

  dispose() {
    _subject.close();
    input.close();
  }
}

class Operators extends BaseEnum<String> {
  const Operators(String val) : super(val);

  static const Operators AC = Operators("AC");
  static const Operators PLUS_MINUS = Operators("+/-");
  static const Operators PERCENTAGE = Operators("%");
  static const Operators DIVIDE = Operators("/");
  static const Operators MULTIPLY = Operators("x");
  static const Operators SUBTRACT = Operators("-");
  static const Operators ADD = Operators("+");
  static const Operators EQUALS = Operators("=");
}

abstract class BaseEnum<T> {
  final T _value;

  const BaseEnum(this._value);

  T get value => _value;
}
