import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int countValue;
  final bool wasIncremented;
  const CounterState({
    required this.countValue,
    required this.wasIncremented,
  });

  @override
  List<Object?> get props => [countValue, wasIncremented];
}
