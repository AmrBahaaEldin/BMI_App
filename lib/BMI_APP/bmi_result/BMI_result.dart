
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result ;
  final bool male;
  final int age;
  const Result({super.key, required this.result, required this.male, required this.age});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new
          ),
        ),
        title: Center(
          child: Text(
            "Result BMI",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,


          ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text("Age:",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                  Text("$age",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                ],
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Gender:",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                  Text("${male ?"Male" :"Female"}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Result:",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                  Text("${result.round()}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
