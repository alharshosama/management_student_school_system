import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/Models/StudentAffairsModel.dart';

import '../repositories/StudentAffairs_Repository.dart';
import '../widget/coustom_appar.dart';

class UpdateStudentAffairs extends StatefulWidget {
   UpdateStudentAffairs({Key? key, required this.StudentAffairs}) : super(key: key);
 // final int Id;
  late StudentAffairsModel? StudentAffairs ;

  @override
  State<UpdateStudentAffairs> createState() => _UpdateStudentAffairsState();
  TextEditingController admissionController = TextEditingController();
  TextEditingController registerController = TextEditingController();
   TextEditingController schedulingController = TextEditingController();
   TextEditingController cardsController = TextEditingController();
   TextEditingController absence_and_attendanceController = TextEditingController();
   TextEditingController communication_with_parentsController = TextEditingController();

}

class _UpdateStudentAffairsState extends State<UpdateStudentAffairs> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  // var admissionCtr = TextEditingController();
  // var registerCtr =TextEditingController();
  // var schedulingCtr =TextEditingController();
  // var cardsCtr =TextEditingController();
  // var absence_and_attendanceCtr =TextEditingController();
  // var communication_with_parentsCtr =TextEditingController();
   var formkey= GlobalKey<FormState>();

  late TextEditingController admissionCtr ;
  late TextEditingController registerCtr ;
  late TextEditingController schedulingCtr ;
  late TextEditingController cardsCtr ;
  late TextEditingController absence_and_attendanceCtr ;
  late TextEditingController communication_with_parentsCtr ;

  var formKey = GlobalKey<FormState>() ;
  void initState() {
    super.initState();
    admissionCtr = TextEditingController(text: widget.StudentAffairs?.admission);
    registerCtr = TextEditingController(text: widget.StudentAffairs?.register);
    schedulingCtr = TextEditingController(text: widget.StudentAffairs?.scheduling);
    cardsCtr = TextEditingController(text: widget.StudentAffairs?.cards);
    absence_and_attendanceCtr = TextEditingController(text: widget.StudentAffairs?.absenceAndAttendance);
    communication_with_parentsCtr = TextEditingController(text: widget.StudentAffairs?.communicationWithParents);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar("Update StudentAffairs"),
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
                        controller: admissionCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Admission must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Admission",
                            labelText: "Admission",
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
                        controller: registerCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Register must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Register",
                            labelText: "Register",
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
                        controller: schedulingCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Scheduling must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Scheduling",
                            labelText: "Scheduling",
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
                        controller: cardsCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Cards must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Cards",
                            labelText: "Cards",
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
                        controller: absence_and_attendanceCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Absence_and_Attendance must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Absence_and_Attendance",
                            labelText: "Absence_and_Attendance",
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
                        controller: communication_with_parentsCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Communication_with_Parents must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Communication_with_Parents ",
                            labelText: "Communication_with_Parents ",
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
                              "Id":widget.StudentAffairs?.id??0,
                              "Admission":admissionCtr.text,
                              "Register":registerCtr.text,
                              "Scheduling":schedulingCtr.text,
                              "Cards":cardsCtr.text,
                              "Absence_and_Attendance":absence_and_attendanceCtr.text,
                              "Communication_with_Parents":communication_with_parentsCtr.text


                            };
                            var updaRes = await StudentAffairsRepository().update(data);
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


