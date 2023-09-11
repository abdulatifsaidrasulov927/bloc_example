import 'package:bloc/bloc.dart';
import 'package:bloc_example/cubit/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 5));

  void increment() {
    emit(CounterState(count: state.count + 1));
  }

  void decrement() {
    emit(CounterState(count: state.count - 1));
  }
}
