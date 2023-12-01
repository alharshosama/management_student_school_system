import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/repositories/Student_Report_Repository.dart';

import '../widget/coustom_appar.dart';

class AddStudentAffairsReports extends StatefulWidget {
  const AddStudentAffairsReports({Key? key}) : super(key: key);

  @override
  State<AddStudentAffairsReports> createState() => _AddStudentAffairsReportsState();
}

class _AddStudentAffairsReportsState extends State<AddStudentAffairsReports> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  var performanceCtr = TextEditingController();
  var attendance_and_absence_reportCtr =TextEditingController();
  var discipline_and_conduct_reportCtr =TextEditingController();
  var personal_development_reportCtr =TextEditingController();
  var home_linkage_reportCtr =TextEditingController();
  var test_reports_andevaluationCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar("Add StudentAffairsReports "),
      body: Form(

              key: formkey,

              child:
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: performanceCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Performance must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Performance",
                            labelText: "Performance",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )

                        ),


                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: attendance_and_absence_reportCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Attendance_and_absence_report must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Attendance_and_absence_report",
                            labelText: "Attendance_and_absence_report",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )

                        ),


                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: discipline_and_conduct_reportCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Discipline_and_conduct_report must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Discipline_and_conduct_report",
                            labelText: "Discipline_and_conduct_report",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )

                        ),


                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        //   obscureText: true,
                        controller: personal_development_reportCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Personal_development_reports must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Personal_development_reports",
                            labelText: "Personal_development_reports",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )

                        ),


                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        //   obscureText: true,
                        controller: home_linkage_reportCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Home_linkage_reports must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Home_linkage_reports",
                            labelText: "Home_linkage_reports",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )

                        ),


                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        //   obscureText: true,
                        controller: test_reports_andevaluationCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Test_reports_andevaluations must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Test_reports_andevaluations ",
                            labelText: "Test_reports_andevaluations ",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )

                        ),


                      ),
                      SizedBox(height: 5,),
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
                              "Performance":performanceCtr.text,
                              "Attendance_and_absence_report":attendance_and_absence_reportCtr.text,
                              "Discipline_and_conduct_report":discipline_and_conduct_reportCtr.text,
                              "Personal_development_report":personal_development_reportCtr.text,
                              "Home_linkage_report":home_linkage_reportCtr.text,
                              "Test_reports_andevaluation":test_reports_andevaluationCtr.text


                            };
                            var addRes = await StudentReportRepository().add(data);
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


