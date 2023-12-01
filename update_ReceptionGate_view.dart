import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/Models/ReceptionGateModel.dart';

import '../repositories/ReceptionGate_Repository.dart';
import '../widget/coustom_appar.dart';

class UpdateReceptionGate extends StatefulWidget {
   UpdateReceptionGate({Key? key, required this.ReceptionGate}) : super(key: key);
 // final int Id;
  late ReceptionGateModel? ReceptionGate ;

  @override
  State<UpdateReceptionGate> createState() => _UpdateReceptionGateState();
   TextEditingController responsibleController = TextEditingController();
   TextEditingController receptionController = TextEditingController();
   TextEditingController gateController = TextEditingController();

}

class _UpdateReceptionGateState extends State<UpdateReceptionGate> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
 // var responsibleCtr = TextEditingController();
 // var receptionCtr = TextEditingController();
 // var gateCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();

  late TextEditingController responsibleCtr ;
  late TextEditingController receptionCtr ;
  late TextEditingController gateCtr ;


  var formKey = GlobalKey<FormState>() ;
  void initState() {
    super.initState();
    responsibleCtr = TextEditingController(text: widget.ReceptionGate?.responsible);
    receptionCtr = TextEditingController(text: widget.ReceptionGate?.reception);
    gateCtr = TextEditingController(text: widget.ReceptionGate?.gate);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar("Update ReceptionGate"),
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
                        controller: responsibleCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Responsible must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Responsible",
                            labelText: "Responsible",
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
                        controller: receptionCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Reception must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Reception",
                            labelText: "Reception",
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
                        controller: gateCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<5){
                            return "Gate must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Gate",
                            labelText: "Gate",
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
                              "Id":widget.ReceptionGate?.id??0,
                              "Responsible":responsibleCtr.text,
                              "Reception":receptionCtr.text,
                              "Gate":gateCtr.text
                            };
                            var updaRes = await ReceptionGateRepository().update(data);
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
