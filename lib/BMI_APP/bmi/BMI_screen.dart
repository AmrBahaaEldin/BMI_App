


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bmi_result/BMI_result.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double height=190;
  int age= 22;
  int weight= 120;
  bool male =true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: Icon(
          Icons.home,
        ),
        title: Center(
          child: Text(

            "Sonic_Fox",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,

          ),
          ),
        ),

        actions: [
          TextButton(onPressed:() {
            print("hola my friend");
          }, child: Icon(
            Icons.menu,
            color: Colors.white,
          ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(onTap:() {
                      setState(() {
                        male=true;
                      });
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: male ? Colors.blue:Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            IconButton(onPressed: () {

                            }, icon: Icon(
                              Icons.man,size: 60,
                            ),),

                            SizedBox(height: 20),
                            Text("Male",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          male=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: male ? Colors.grey:Colors.blue ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            IconButton(onPressed:() {

                            }, icon: Icon(
                              Icons.woman,size: 60,
                            ),),

                            SizedBox(height: 20),
                            Text("Female",style:
                            TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Height",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,),),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline:TextBaseline.alphabetic,
                          children: [
                            Text("${height.round()}",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),

                            Text("CM"),
                          ],
                        ),
                        Slider(value:height ,
                          min: 50,
                          max: 4000,
                          onChanged: (value) {
                            setState(() {
                              height=value;
                              print(height.round());
                            });
                          },
                        )
                      ],
                    )



                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age",style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight .bold)),
                          SizedBox(height: 10),
                          Text("$age",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),),
                          SizedBox(height: 10),
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  age--;
                                  print(age);
                                });

                              },child: Icon(
                                  Icons.remove
                              ),),
                              SizedBox(width: 20,),
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  age++;
                                  print(age);
                                });
                              },child: Icon(
                                  Icons.add
                              ),),

                            ],
                          ),



                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("weight",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),),
                          SizedBox(height: 10),

                          Container(

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$weight",style:
                                TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("Kg",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },child: Icon(
                                  Icons.remove
                              ),),
                              SizedBox(width: 20,),
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },child: Icon(
                                  Icons.add
                              ),),

                            ],
                          ),



                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red
              ),


              child: TextButton(onPressed: () {

                double Final=weight/pow(height/ 100,2);
                print(Final.round());
                Navigator.push(context,
                  MaterialPageRoute(
                      builder:(context) => Result(
                          result: Final,
                          male: male,
                          age: age)


                  ),
                );

              }, child: Text("CalCulate",style: TextStyle(


                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,

              ),
              ),),
            ),
          )


        ],
      ),









    );



  }
}

