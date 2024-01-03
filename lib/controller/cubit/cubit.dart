// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/controller/cubit/states.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(InitialTodoState());
  static TodoCubit get(context) => BlocProvider.of(context);

  Database? database;

  void createDatabase() {
    openDatabase('todis.db', version: 1, onCreate: (database, version) {
      database
          .execute('CREATE TABLE task '
              '(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,description TEXT)')
          .then((value) {
        print('our table is created');
      }).catchError((error) {
        print('an error occured when creating a table');
      });
    }, onOpen: (database) {
      print('database is open');
      getFromDatabase(database);
    }).then((value) {
      database = value;
      emit(CreateTodoDatabaseState());
    }).catchError((error) {
      print('an eror occured when opening the file');
    });
  }

  void insertToDatabase({
    required title,
    required date,
    required time,
    required description,
    String status = 'now',
  }) {
    database!.transaction((txn) async {
      txn
          .rawInsert('INSERT INTO task'
              '(title,date,time ,description) VALUES'
              '("$title","$date","$time","$description")')
          .then((value) {
        print('$value');
        getFromDatabase(database);
        emit(InsertToTodoDatabaseState());
      }).catchError((error) {
        print('an error when inserting to database');
      });
    });
  }

  List task = [];

  void getFromDatabase(database) {
    task = [];
    database!.rawQuery('SELECT * FROM task').then((value) {
      for (var i in value) {
        task.add(i);
      }
      emit(GettingFromTodoDatabaseState());
    }).catchError((error) {
      print('error when getting from database');
    });
  }

  void updateDatabase({
    required String title,
    required String date,
    required String time,
    required String description,
    required int id,
  }) {
    database!
        .update(
            'task',
            {
              "title": title,
              "date": date,
              "time": time,
              "description": description
            },
            where: 'id =?',
            whereArgs: [id])
        .then((value) {
      print('$value updating data successful');
      getFromDatabase(database);
      emit(UpdateTodoDatabaseState());
    }).catchError((error) {
      print('error when updating data');
    });
  }

  void deleteDatabase({required int id}) {
    database!.rawDelete('DElETE FROM task WHERE id = ?', [id]).then((value) {
      print('$value sucessfully deleted');
      emit(DeleteTodoDatabaseState());
      getFromDatabase(database);
    }).catchError((error) {
      print('error deleting data');
    });
  }
}
