
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/state.dart';
import 'package:sqflite/sqflite.dart';
import '../network/local/cache_helper.dart';



class AppCubit extends Cubit<AppStates> {




  AppCubit() :super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  int currentindex = 0;




  List<String>ScreenText =
  [

    "TaskPage",
    "DonePage",
    "ArchivePage",
  ];


  void changeIndex(int index) {
    currentindex = index;
    emit(AppChangeButtonNavBarState());
  }

  late Database database;
  List<Map>newTasks = [];
  List<Map>doneTasks = [];
  List<Map>archiveTasks = [];

  void CreateData() {
    openDatabase(
      'sonic.db',
      version: 1,

      onCreate: (Database db, version) async {
        print('database created');
        await db.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY ,title TEXT,date TEXT,time TEXT,status TEXT)');
      },


      onOpen: (Database db) {
        getDatafromData(db);
        print('database opened');
       },
    ).then((value) => database = value);
    emit(AppCreateDatabaseState());
  }

  IconData deaulticon = Icons.edit;
  bool isshowBottomSheet = false;


  void changeBottomSheetState({
    required bool isshow,
    required IconData icon,
  }) {
    deaulticon = icon;
    isshowBottomSheet = isshow;
    emit(AppChangeButtonSheetState());
  }


  InsertDatabase({required String title,
    required String time,
    required String day
  }) async
  {
    await database.transaction((txn) =>
        txn.rawInsert(
            'INSERT INTO tasks(title,date,time,status) VALUES("$title","$day","$time","New")'
        ).then((value) {
          print("$value:Insert set database");
          emit(AppInsertDatabaseState());
          getDatafromData(database);
        }).catchError((error) {
          print("Error is every is ${error.toString()}");
        }));
  }

  void getDatafromData(db)
  {
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
    emit(AppGetDatabaseLoadingState());
     db.rawQuery('SELECT * FROM tasks').then((value) {

       value.forEach((element) {
         if(element['status']=='New')
          newTasks.add(element);
         else if (element['status']=='done')
          doneTasks.add(element);
         else
           archiveTasks.add(element);

       }
       ); emit(AppGetDatabaseState());

       
     });
  }


void upDatabaseState(
  {required String status,
  required int id}
    ) async {
  database.rawUpdate(
      'UPDATE tasks SET status = ?WHERE id = ?',
      ['$status', id],
    
 ).then((value) {
    getDatafromData(database);
   emit(AppUpdataDatabaseState());
 });
}

void delteDatabaseState(
  {
  required int id}
    ) async {
  database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],

 ).then((value) {
    getDatafromData(database);
   emit(AppDelteDatabaseState());
 });
}
  bool isDark = true;

  void ChangeTheme({ bool? fromShared }) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeTheme());
      });
    }
  }


}
