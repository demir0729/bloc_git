import 'package:bloc/bloc.dart';
import 'package:bloc_git/logic/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterState(countValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(countValue: state.countValue + 1, wasIncremented: true));
  void decrement() => emit(
      CounterState(countValue: state.countValue - 1, wasIncremented: false));
}
