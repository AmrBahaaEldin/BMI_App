
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../cubit/cubit.dart';

Widget defualtButton({
  double? width=double.infinity,
  double? height =50,
  bool isUppercase=false,
  Color? color=Colors.blue,
  required String text ,
  required  Function()   pressed,})=> Container(
    color: color,
    width: width,


  child: MaterialButton(
    onPressed:pressed,


    child: Text(

        isUppercase? text.toUpperCase():text,
      style:TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,

      ) ,


  ),
    height: height,
  ),
);
///////////////////////////////////////////////////////////////////////////////////
 Widget defaultTextButton({required Function() press,required String text })=> TextButton(onPressed: press, child: Text(text.toUpperCase()));
//////////////////////////////////////////////////////////////////////////////////
Widget FieldButton({
  required TextInputType type,
  required TextEditingController controller,
 void Function(dynamic value) ?onchange,
   Function(String value)  ?onsubmit,
 required String? Function(String? value) valid ,
 bool ispassword =false,
  required Widget prefix,
  Widget ?suffix,

  Function()?suffixpressed,
  Function()? tap,

  required String label,})=>TextFormField(
    onChanged:onchange,
   onFieldSubmitted: onsubmit,

  validator: valid,
  obscureText: ispassword ,
  
  keyboardType: type,
  controller: controller,
  onTap: tap,
  decoration: InputDecoration(
    labelText:label ,
    prefixIcon:prefix,
    suffixIcon:suffix != null?IconButton(onPressed:suffixpressed,
        icon:suffix):null,
    border: OutlineInputBorder(),
    
    ) ,

  );




////toggle between page ////
Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    color: Colors.grey,
    height: 2,
  ),
);
////////////////////////////////////////////////////////////
void navigateTo(context,widget)=>Navigator.push(context,
    MaterialPageRoute(builder: (context) => widget));
void navigateAndfinsh(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
        builder: (context) => widget), (route) => false);


////////////////////////////////






//////////////////////project 2
Widget buildTaskItem(Map model,context)=>Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(mainAxisAlignment: MainAxisAlignment.start,



      children: [

        CircleAvatar(radius: 40,

          child: Text("${model['time']}"),),

        SizedBox(width: 20,),

        Expanded(

          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min,

            children: [

              Text("${model['title']}",

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                    color: Colors.black,



                  )),

              Text("${model['date']}",style: TextStyle(

                fontSize: 10,



                color: Colors.grey,



              )),

            ],

          ),

        ),

        SizedBox(width: 20,),

        IconButton(onPressed: () {

          AppCubit.get(context).upDatabaseState(status: 'done', id: model['id']);



        }, icon:Icon(Icons.check_box_outlined),color: Colors.green,  ),

        IconButton(onPressed: () {

          AppCubit.get(context).upDatabaseState(status: 'archive', id: model['id']);

        }, icon:Icon(Icons.archive_outlined),color: Colors.blue,  ),



      ],

    ),

  ),
  onDismissed: (direction) {
    AppCubit.get(context).delteDatabaseState(id: model['id']);

  },
);
//////////////////////project 2
Widget  taskBuilder( {required List<Map> list})=>ConditionalBuilder(

condition: list.length>0,
builder: (context) =>
    ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(list[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length),
        fallback: (context) =>  Center(child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.menu,),
Text('No Tasks yet ,please Add some Tasks'),
],
),
),


);
///////////////////////////end project 2










///////// project 1/////////////////////////////////////////////////////

// Widget bulidArticleItem(list,context) =>InkWell(
//   onTap: () {
//     navigateTo(context, webViewScreen(list['url']));
//   },
//   child:   Padding(
//
//   padding: const EdgeInsets.all(20.0),
//
//   child: Row(
//
//   children: [
//
//   Container(
//
//   width: 120.0,
//
//   height: 120.0,
//
//   decoration: BoxDecoration(borderRadius:BorderRadius.circular(30.0),
//
//   image: DecorationImage(image:NetworkImage('${list['urlToImage']}'),
//
//   fit: BoxFit.fill),
//
//
//
//   ),
//
//   ),
//
//   SizedBox(width: 10,),
//
//   Expanded(
//
//   child: Column(mainAxisSize: MainAxisSize.min,
//
//   crossAxisAlignment: CrossAxisAlignment.start,
//
//   children: [
//
//   Text('${list['title']}',
//
//       style: Theme.of(context).textTheme.bodyLarge,
//
//   maxLines: 4,overflow: TextOverflow.ellipsis),
//
//   SizedBox(height: 30,),
//
//   Text('${list['publishedAt']}',style: TextStyle(
//
//   fontSize: 10.0,
//
//   fontWeight: FontWeight.bold,
//
//   color:Colors.grey,
//
//   ),),
//
//
//
//   ],),
//
//   ),
//
//   ],
//
//
//
//
//
//   ),
//
//   ),
// );



// Widget articleBuilder(list,context,{isSearch=false,countItem})=>ConditionalBuilder(condition:list.length>0 ,
//     builder: (context) =>
//         ListView.separated(physics: BouncingScrollPhysics(),
//
//             itemBuilder: (context, index) =>bulidArticleItem(list[index],context) ,
//             separatorBuilder:(context, index) => myDivider() ,
//             itemCount:countItem),
//
//     fallback:(context) =>isSearch ? Container():Center(child: CircularProgressIndicator()));
////////project 1/////////////






