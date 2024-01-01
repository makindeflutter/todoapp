import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/cubit/cubit.dart';
import 'package:todoapp/controller/cubit/states.dart';
import 'package:todoapp/screens/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            titleTextStyle: Theme.of(context).textTheme.headlineLarge,
            title: const Text(
              'Todo',
            ),
          ),
          body: ListView.builder(
              itemCount: cubit.task.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.task[index]['title'],
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              cubit.task[index]['time'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            IconButton(
                                onPressed: () {
                                  cubit.deleteDatabase(
                                      id: cubit.task[index]['id']);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                        Text(
                          cubit.task[index]['description'],
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const AddTaskScreen();
              }));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
