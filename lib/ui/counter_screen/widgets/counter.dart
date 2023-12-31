import 'package:bloc_example/cubit/counter/counter_cubit.dart';
import 'package:bloc_example/cubit/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
      return Text(state.count.toString(),
          style: Theme.of(context).textTheme.headline2);
    });
  }
}
