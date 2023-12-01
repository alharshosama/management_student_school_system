import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/Models/SchoolWarehouseModel.dart';

import '../repositories/Student_Warehouse_Repository.dart';
import '../widget/coustom_appar.dart';

class UpdateSchoolWarehouse extends StatefulWidget {
   UpdateSchoolWarehouse({Key? key, required this.SchoolWarehouse}) : super(key: key);
 // final int Id;
  late SchoolWarehouseModel? SchoolWarehouse ;

  @override
  State<UpdateSchoolWarehouse> createState() => _UpdateSchoolWarehouseState();
   TextEditingController itemController = TextEditingController();
   TextEditingController quantityController = TextEditingController();
}

class _UpdateSchoolWarehouseState extends State<UpdateSchoolWarehouse> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
 // var itemCtr = TextEditingController();
 // var quantityCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();

  late TextEditingController itemCtr ;
  late TextEditingController quantityCtr ;

  var formKey = GlobalKey<FormState>() ;
  void initState() {
    super.initState();
    itemCtr = TextEditingController(text: widget.SchoolWarehouse?.item);
    quantityCtr = TextEditingController(text: widget.SchoolWarehouse?.quantity);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
      appBar: CustomAppbar("Update SchoolWarehouse"),
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
                        controller: itemCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Item must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Item",
                            labelText: "Item",
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
                        controller: quantityCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<5){
                            return "Quantity must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Quantity",
                            labelText: "Quantity",
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
                          //  print(widget.Id);
                           // print("Osama");
                            var data = {
                              "Id":widget.SchoolWarehouse?.id??0,
                              "Item":itemCtr.text,
                              "Quantity":quantityCtr.text
                            };
                            var updaRes = await SchoolWarehouseRepository().update(data);
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
