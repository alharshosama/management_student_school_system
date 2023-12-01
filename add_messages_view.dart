import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/repositories/Message_Repository.dart';

import '../widget/coustom_appar.dart';

class AddMessages extends StatefulWidget {
  const AddMessages({Key? key}) : super(key: key);

  @override
  State<AddMessages> createState() => _AddMessagesState();
}

class _AddMessagesState extends State<AddMessages> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  var messagelCtr = TextEditingController();
  var timeCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar("Add Messages"),
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
                        controller: messagelCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "message must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "message",
                            labelText: "message",
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
                        controller: timeCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<5){
                            return "time must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "time",
                            labelText: "time",
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
                              "Message":messagelCtr.text,
                              "Time":timeCtr.text
                            };
                            var addRes = await MessageRepository().add(data);
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
