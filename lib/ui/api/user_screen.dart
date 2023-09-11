import 'package:bloc_example/bloc/user_bloc/user_bloc.dart';
import 'package:bloc_example/bloc/user_bloc/user_event.dart';
import 'package:bloc_example/bloc/user_bloc/user_state.dart';
import 'package:bloc_example/model/user_model.dart';
import 'package:bloc_example/reppostory/user_repostory/user_repostory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreenApi extends StatelessWidget {
  const UserScreenApi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('The BloC App')),
        body: BlocProvider(
          create: (context) => UserBloc(
            UserRepository(),
          )..add(LoadUserEvent()),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserErrorState) {
                return const Center(child: Text("Error"));
              }
              if (state is UserLoadedState) {
                List<UserModel> userList = state.users;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Card(
                            color: Theme.of(context).primaryColor,
                            child: ListTile(
                                title: Text(
                                  '${userList[index].firstName}  ${userList[index].lastName}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  '${userList[index].email}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      userList[index].avatar.toString()),
                                ))),
                      );
                    });
              }

              return Container();
            },
          ),
        ));
  }
}
