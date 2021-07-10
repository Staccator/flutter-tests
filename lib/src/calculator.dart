class Calculator {
  double add(double a, double b) => a + b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) throw ArgumentError();
    return a / b;
  }

  Future<double> powerOfTwo(double a) {
    return Future.delayed(Duration(milliseconds: 100), () => a * a);
  }

  Stream<double> pi() => Stream.fromIterable([3, 3.1, 3.14]);
}
