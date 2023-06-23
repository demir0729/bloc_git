import 'package:bloc_git/counter_cubit/counter_cubit.dart';
import 'package:bloc_git/counter_cubit/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late final CounterCubit counterCubit;
    setUp(() => counterCubit = CounterCubit());
    tearDown(() => counterCubit.close());
    test('başlangıç durumu ile verilen durum aynıdır', () {
      expect(counterCubit.state,
          const CounterState(countValue: 0, wasIncremented: false));
    });
  });
}
