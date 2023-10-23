



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/Blockobserver.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/network/Remote/dio_helper.dart';
import 'package:untitled/shared/styles/themes.dart';
import 'BMI_APP/bmi/BMI_screen.dart';
import 'shared/network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//because put in main async should put method that save any thing before run app execute
  Bloc.observer = MyBlocObserver() as BlocObserver;
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark =  CacheHelper.getBoolean(key:'isDark') ;
  runApp( MyApp(isDark));

}
//class MyApp
class MyApp extends StatelessWidget
{
 final  isDark;

  MyApp(this.isDark);




 // appNewsChangeThem(fromShared: isDark,)



  @override
  Widget build(BuildContext context) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,


          home:BMIScreen(),

        );



  }

}




