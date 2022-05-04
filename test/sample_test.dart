import 'package:refactoring_dart/src/sample.dart';
import 'package:test/test.dart';

void main() {
  test('first test', () {
    final sample = Sample();
    final actual = sample.returnOne();
    expect(actual, equals(1));
  });
}
