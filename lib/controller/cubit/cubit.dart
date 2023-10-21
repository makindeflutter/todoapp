import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/controller/cubit/states.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(InitialTodoState());
  static TodoCubit get(context) => BlocProvider.of(context);

  Database? database;

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      database
          .execute('CREATE TABLE task '
              '(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,description TEXT)')
          .then((value) {})
          .catchError((error) {});
    }, onOpen: (database) {})
        .then((value) {
      database = value;
      emit(CreateTodoDatabaseState());
    }).catchError((error) {});
  }

  void insertToDatabase() {
    database!.transaction((txn) async {
      txn
          .rawInsert('INSERT INTO tasks'
              '(title,date,time ,description) VALUES'
              '("gym workout ","25-05","8:00","go to suf ")')
          .then((value) {
        emit(InsertToTodoDatabaseState());
      }).catchError((error) {});
    });
  }
}
