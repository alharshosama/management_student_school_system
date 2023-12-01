
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/SchoolBusPage/update_SchoolBus_view.dart';
import 'package:management_student/repositories/School_Bus_Repository.dart';

import '../Models/SchoolBusModel.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'add_bus_view.dart';
import 'delete_bus_view.dart';

class SchoolBusPage extends StatefulWidget {
  const SchoolBusPage({Key? key}) : super(key: key);

  @override
  State<SchoolBusPage> createState() => _SchoolBusPageState();
}

class _SchoolBusPageState extends State<SchoolBusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("School Bus Management"),
      body: Container(
        child:FutureBuilder<List<SchoolBusModel>>(
          future:SchoolBusRepository().getAll(),
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
                          title: Text("${list[index].driver},"
                          "${list[index].bus}"),
                          subtitle: Text("${list[index].phoneNumber}"),
                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                          return UpdateSchoolBus(SchoolBus: list[index]);
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
                                          return DeleteBus(itemId: list[index].id??0,);
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
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddBus()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),
    );
  }
}
