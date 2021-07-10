import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/src/calculator.dart';

void main() {
  late Calculator calculator;
  setUp(() {
    calculator = Calculator();
  });
  tearDown(() => print('${calculator.hashCode}'));

  group('add', () {
    test('the calculator return 4 when adding 2 and 2', () {
      var result = calculator.add(2, 2);
      expect(result, 4);
    });
    test('the calculator return 8 when adding 3 and 5', () {
      var result = calculator.add(3, 5);
      expect(result, 8);
    });
  });

  group('multiply', () {
    test('the calculator return 4 when multiplying 2 and 2', () {
      var result = calculator.multiply(2, 2);
      expect(result, 4);
    });
    test('the calculator return 8 when multiplying 2 and 4', () {
      var result = calculator.multiply(2, 4);
      expect(result, 8);
    });
  });

  group('divide', () {
    test('the calculator return error when dividing by 0', () {
      expect(() => calculator.divide(2, 0), throwsArgumentError);
    });
  });

  group('powerOfTwo', () {
    test('returns 81 when input is 9', () async {
      expect(await calculator.powerOfTwo(9), 81);
    });
  });

  group('pi ', () {
    test('pi returns 3, 3.1, 3.14 in that order', () async {
      expect(calculator.pi(), emitsInOrder([3, 3.1, 3.14]));
    });
  });

  test('not null', () {
    expect(Calculator(), isNotNull);
    expect(2.0, isA<double>());
  });
}
