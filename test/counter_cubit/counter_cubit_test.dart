import 'package:bloc_git/logic/counter_cubit/counter_cubit.dart';
import 'package:bloc_git/logic/counter_cubit/counter_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() => counterCubit!.close());

    test('counter cubit succefull', () {
      expect(counterCubit!.state,
          const CounterState(countValue: 0, wasIncremented: false));
    });
    blocTest<CounterCubit, CounterState>(
      'increment function is succefull',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => const <CounterState>[
        CounterState(countValue: 1, wasIncremented: true)
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'decrement function is succefull',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => const <CounterState>[
        CounterState(countValue: -1, wasIncremented: false)
      ],
    );
  });
}
