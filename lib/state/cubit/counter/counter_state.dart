part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int value;
  bool wasIncremented;

  CounterState(this.value, this.wasIncremented);

  @override
  List<Object?> get props => [value, wasIncremented];
}
