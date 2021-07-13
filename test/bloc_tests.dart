import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tests/src/counter_cubit.dart';

main() {
  blocTest(
    'emits [] when nothing is added',
    build: () => CounterCubit(),
    expect: () => [],
  );
  blocTest(
    'emits [1] when increment is called',
    build: () => CounterCubit(),
    act: (CounterCubit bloc) => bloc.increment(),
    expect: () => [1],
  );
  String x = '';
  // x.
  blocTest(
    'emits [10] when increment is called and is seeded with 9',
    build: () => CounterCubit(),
    seed: () => 9,
    act: (CounterCubit bloc) => bloc.increment(),
    expect: () => [10],
  );
}
