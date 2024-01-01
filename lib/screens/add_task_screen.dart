import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/controller/cubit/cubit.dart';
import 'package:todoapp/controller/cubit/states.dart';
import 'package:todoapp/shared/styles/component.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController timerController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        if (state is InsertToTodoDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add your task'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  customTextFormField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please add your title';
                      }
                      return null;
                    },
                    label: 'Title',
                    prefixicon: Icons.title,
                    hintText: 'add your title',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  customTextFormField(
                      controller: timerController,
                      keyboardType: TextInputType.datetime,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please add your Time';
                        }
                        return null;
                      },
                      label: 'Time',
                      prefixicon: Icons.watch_later_outlined,
                      hintText: 'add your Time',
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          timerController.text = value!.format(context);
                        }).catchError((error) {
                          timerController.clear();
                        });
                      }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  customTextFormField(
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please add your date';
                      }
                      return null;
                    },
                    label: 'Date',
                    prefixicon: Icons.calendar_view_day,
                    hintText: 'add your date',
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2040-12-20'))
                          .then((value) {
                        dateController.text = DateFormat.yMMMd().format(value!);
                      }).catchError((error) {
                        dateController.clear();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  customTextFormField(
                    controller: desController,
                    keyboardType: TextInputType.text,
                    lines: 5,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please add your description ';
                      }
                      return null;
                    },
                    label: 'Description',
                    prefixicon: Icons.note,
                    hintText: 'add your description',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    height: 40.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    minWidth: double.infinity,
                    color: Colors.deepPurple,
                    onPressed: () {
                      cubit.insertToDatabase(
                          title: titleController.text,
                          date: dateController.text,
                          time: timerController.text,
                          description: desController.text);
                    },
                    child: const Text('Add Task'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
