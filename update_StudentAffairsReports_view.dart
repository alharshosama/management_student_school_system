import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/Models/StudentReportModel.dart';

import '../repositories/Student_Report_Repository.dart';
import '../widget/coustom_appar.dart';

class UpdateStudentAffairsReports extends StatefulWidget {
   UpdateStudentAffairsReports({Key? key, required this.StudentReport}) : super(key: key);
 // final int Id;
  late StudentReportModel? StudentReport ;

  @override
  State<UpdateStudentAffairsReports> createState() => _UpdateStudentAffairsReportsState();
  TextEditingController performanceController = TextEditingController();
  TextEditingController  attendance_and_absence_reportController = TextEditingController();
  TextEditingController discipline_and_conduct_reportController = TextEditingController();
  TextEditingController personal_development_reportController = TextEditingController();
  TextEditingController home_linkage_reportController = TextEditingController();
  TextEditingController test_reports_andevaluationController = TextEditingController();
}

class _UpdateStudentAffairsReportsState extends State<UpdateStudentAffairsReports> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  // var performanceCtr = TextEditingController();
  // var attendance_and_absence_reportCtr =TextEditingController();
  // var discipline_and_conduct_reportCtr =TextEditingController();
  // var personal_development_reportCtr =TextEditingController();
  // var home_linkage_reportCtr =TextEditingController();
  // var test_reports_andevaluationCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();

  late TextEditingController performanceCtr ;
  late TextEditingController attendance_and_absence_reportCtr ;
  late TextEditingController discipline_and_conduct_reportCtr ;
  late TextEditingController personal_development_reportCtr ;
  late TextEditingController home_linkage_reportCtr ;
  late TextEditingController test_reports_andevaluationCtr ;

  var formKey = GlobalKey<FormState>() ;
  void initState() {
    super.initState();
    performanceCtr = TextEditingController(text: widget.StudentReport?.performance);
    attendance_and_absence_reportCtr = TextEditingController(text: widget.StudentReport?.attendanceAndAbsenceReport);
    discipline_and_conduct_reportCtr = TextEditingController(text: widget.StudentReport?.disciplineAndConductReport);
    personal_development_reportCtr = TextEditingController(text: widget.StudentReport?.personalDevelopmentReport);
    home_linkage_reportCtr = TextEditingController(text: widget.StudentReport?.homeLinkageReport);
    test_reports_andevaluationCtr = TextEditingController(text: widget.StudentReport?.testReportsAndevaluation);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar("Update StudentAffairsReports "),
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
                              "Id":widget.StudentReport?.id??0,
                              "Performance":performanceCtr.text,
                              "Attendance_and_absence_report":attendance_and_absence_reportCtr.text,
                              "Discipline_and_conduct_report":discipline_and_conduct_reportCtr.text,
                              "Personal_development_report":personal_development_reportCtr.text,
                              "Home_linkage_report":home_linkage_reportCtr.text,
                              "Test_reports_andevaluation":test_reports_andevaluationCtr.text


                            };
                            var updaRes = await StudentReportRepository().update(data);
                            if(updaRes>0 ){
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


                      }, child:const Text("Update")),

                      isError? Text("Error$error",style: TextStyle(color: Colors.red),):SizedBox(),
                      isSuccess? Text("Added Successfully",style: TextStyle(color: Colors.green),):SizedBox()
                    ],
                  ),
                ),

              )),



    );
  }
}
