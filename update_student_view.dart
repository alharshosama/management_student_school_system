
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/StudentModel.dart';
import '../repositories/Student_Repository.dart';
import '../widget/coustom_appar.dart';



class UpdateStudentPage extends StatefulWidget {
   UpdateStudentPage({Key? key,required this.student}) : super(key: key);
  // final int Id;
   final StudentModel? student ;


  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
  TextEditingController nameController = TextEditingController();
  TextEditingController levelController = TextEditingController();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  // var nameCtr = TextEditingController();
  // var levelCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();

  late TextEditingController nameCtr ;
  late TextEditingController levelCtr ;
  var formKey = GlobalKey<FormState>() ;
  void initState() {
    super.initState();
    nameCtr = TextEditingController(text: widget.student?.name);
    levelCtr = TextEditingController(text: widget.student?.level);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar("Update Student"),
      body: Form(

              key: formkey,

              child:
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                        //   obscureText: true,
                        controller: levelCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<5){
                            return "Level must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Level",
                            labelText: "Level",
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
                              //Here
                             "Id":widget.student?.id??0,
                              "Name":nameCtr.text,
                              "Level":levelCtr.text
                            };
                            print(data);
                            var updaRes = await StudentRepository().update(data);
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


