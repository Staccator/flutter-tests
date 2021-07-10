import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/calculator_app.dart';
import 'package:mockito/mockito.dart';

class MockModifier extends Mock implements Modifier {
  @override
  String modify(String value) => 'mocked';
}

void main() {
  late MockModifier modifier;
  setUp(() {
    modifier = MockModifier();
  });

  group('CalculatorApp', () {
    testWidgets('matches golden file', (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp(modifier: modifier));
      await expectLater(find.byType(CalculatorApp), matchesGoldenFile('goldens/calculator_app.png'));
    }, tags: 'no-ci');

    testWidgets('renders two widgets of type TwoDigitOperation', (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp(modifier: modifier));
      expect(find.byType(TwoDigitOperation), findsNWidgets(2));
    });

    testWidgets('has text "test" after entering "test" into text field', (WidgetTester tester) async {
      // when(modifier.modify('test')).thenReturn('mocked');

      await tester.pumpWidget(CalculatorApp(modifier: modifier));
      final textField = find.byKey(TestedTextsState.textFieldKey);
      // act
      await tester.enterText(textField, 'test');
      await tester.pump();
      // assert
      expect(find.text('mocked'), findsOneWidget);
      // verify(modifier.modify('test')).called(1);
    });
  });
}
