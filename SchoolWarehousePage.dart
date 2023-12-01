

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/SchoolWarehouse/update_SchoolWarehouse_view.dart';
import 'package:management_student/repositories/Student_Warehouse_Repository.dart';

import '../Models/SchoolWarehouseModel.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'add_warehouse_view.dart';
import 'delete_warehouse_view.dart';

class SchoolWarehousePage extends StatefulWidget {
  const SchoolWarehousePage({Key? key}) : super(key: key);

  @override
  State<SchoolWarehousePage> createState() => _SchoolWarehousePageState();
}

class _SchoolWarehousePageState extends State<SchoolWarehousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("School Warehouse Management"),
      body: Container(
        child:FutureBuilder<List<SchoolWarehouseModel>>(
          future:SchoolWarehouseRepository().getAll(),
          builder:(context,snapchat){
            if(snapchat.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(snapchat.connectionState == ConnectionState.done){
              if(snapchat.hasError){
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }
              else if(snapchat.hasData){
                var list = snapchat.data ?? [];
                return RefreshIndicator(
                  onRefresh: ()async{
                    setState(() {

                    });
                  },

                  child: ListView.separated(
                      itemBuilder:(context,index){
                        return ListTile(
                          leading: Text("${list[index].id}"),
                          title: Text("${list[index].item}"),
                          subtitle: Text("${list[index].quantity}"),
                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                          return UpdateSchoolWarehouse(SchoolWarehouse: list[index]);
                                        });
                                        if(updaRes !=null && updaRes ==true){
                                          setState(() {

                                          });
                                        }
                                      },
                                      icon:const Icon(
                                          Icons.edit,
                                      color: Colors.teal,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: ()async{
                                        var delRes= await showDialog(context: context, builder: (context){
                                          return DeleteSchoolWarehouse(itemId: list[index].id??0,);
                                        });
                                        if(delRes !=null && delRes ==true){
                                          setState(() {

                                          });
                                        }
                                      },
                                      icon:const Icon(
                                          Icons.delete,
                                      color: Colors.red,
                                      ),

                                    )
                                  ],
                                )
                            )

                        );

                      },
                      separatorBuilder: (context,index){
                        return Divider();

                      }, itemCount: list.length),
                );

              }

              else{
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }

            }

            else{
              return Center(child: Text("Erorr:${snapchat.error.toString()}"));

            }

          },  ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()async{
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddSchoolWarehouse()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),
    );
  }
}
