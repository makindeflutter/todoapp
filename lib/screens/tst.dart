import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/cubit/cubit.dart';
import 'package:todoapp/controller/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      cubit.createDatabase();
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      cubit.insertToDatabase();
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ),
        );
      },
    );
  }
}
