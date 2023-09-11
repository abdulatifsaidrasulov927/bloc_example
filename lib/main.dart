import 'package:bloc_example/bloc/user_bloc/user_bloc.dart';
import 'package:bloc_example/reppostory/user_repostory/user_repostory.dart';
import 'package:bloc_example/ui/api/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
        create: (BuildContext context) => UserBloc(UserRepository()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserScreenApi(),
    );
  }
}
