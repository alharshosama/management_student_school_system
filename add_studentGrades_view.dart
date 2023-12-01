import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/repositories/StudentsGrades_Repository.dart';

import '../widget/coustom_appar.dart';

class AddStudentGrades extends StatefulWidget {
  const AddStudentGrades({Key? key}) : super(key: key);

  @override
  State<AddStudentGrades> createState() => _AddStudentGradesState();
}

class _AddStudentGradesState extends State<AddStudentGrades> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  var nameCtr = TextEditingController();
  var subjectCtr = TextEditingController();
  var gradesCtr = TextEditingController();
  var formkey= GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar(" AddStudentGrades"),
      body: Form(
          key: formkey,

          child:
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black87),
                    validator: (val){
                      if(val==null){
                        return "This is value is null";

                      }
                      if(val.length<3){
                        return "Name must be more than 5 chars";

                      }
                      /* else if(!val.contains("@")){
                        return "name must inculde @ char";

                      }*/
                    },
                    decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                        counterText: "20",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        )

                    ),


                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: subjectCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black87),
                    validator: (val){
                      if(val==null){
                        return "This is value is null";

                      }
                      if(val.length<3){
                        return "Subject must be more than 5 chars";

                      }
                      /* else if(!val.contains("@")){
                        return "name must inculde @ char";

                      }*/
                    },
                    decoration: InputDecoration(
                        hintText: "Subject",
                        labelText: "Subject",
                        counterText: "20",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        )

                    ),


                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    //   obscureText: true,
                    controller: gradesCtr,
                    style: TextStyle(color: Colors.black87),
                    validator: (val){
                      if(val==null){
                        return "This is value is null";

                      }
                      if(val.length<2){
                        return "Grades must be more than 5 chars";

                      }
                      /*  else if(!val.contains("&")){
                        return "Details must inculde & char";

                      }*/
                    },
                    decoration: InputDecoration(
                        hintText: "Grades",
                        labelText: "Grades",
                        counterText: "20",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        )

                    ),


                  ),
                  SizedBox(height: 20,),
                  loading ?CircularProgressIndicator() : TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black87, // foreground
                          backgroundColor: Colors.teal),
                      onPressed: ()async{
                    if(formkey.currentState!.validate()){
                      try{
                        setState(() {
                          loading =true;
                        });
                        var data = {
                          "Name":nameCtr.text,
                          "Subject":subjectCtr.text,
                          "Grades":gradesCtr.text
                        };
                        var addRes = await StudentGradesRepository().add(data);
                        if(addRes>0 ){
                          setState(() {
                            loading =false;
                            isSuccess =true;
                            isError =false;
                            error="";
                          });
                          Navigator.of(context).pop(true);
                        }
                        else{
                          setState(() {
                            loading =false;
                            isSuccess =false;
                            isError =true;
                            error="Operation field!!!";
                          });

                        }

                      }
                      catch(e) {
                        setState(() {
                          loading =false;
                          isSuccess =false;
                          isError =true;
                          error="Exp: ${e.toString()}";
                        });

                      }
                    }
                    else{
                      // error="Operation field!!!";
                    }


                  }, child:const Text("Send")),

                  isError? Text("Error$error",style: TextStyle(color: Colors.red),):SizedBox(),
                  isSuccess? Text("Added Successfully",style: TextStyle(color: Colors.green),):SizedBox()
                ],
              ),
            ),

          )),


    );
  }
}
