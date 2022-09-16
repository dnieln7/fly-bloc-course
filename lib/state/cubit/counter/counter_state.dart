part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int value;
  final bool wasIncremented;

  const CounterState(this.value, this.wasIncremented);

  @override
  List<Object?> get props => [value, wasIncremented];
}
