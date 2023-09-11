import 'package:bloc_example/ui/counter_screen/widgets/counter.dart';
import 'package:bloc_example/ui/counter_screen/widgets/floatinf_counter.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Count(),
      ),
      floatingActionButton: FloatingCounter(),
    );
  }
}
