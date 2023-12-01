
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/StudentAffairs/update_StudentAffairs_view.dart';
import 'package:management_student/repositories/StudentAffairs_Repository.dart';

import '../Models/StudentAffairsModel.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'Delete_student_affairs_view.dart';
import 'add_StudentAffairs_view.dart';

class StudentAffairsPage extends StatefulWidget {
  const StudentAffairsPage({Key? key}) : super(key: key);

  @override
  State<StudentAffairsPage> createState() => _StudentAffairsPageState();
}

class _StudentAffairsPageState extends State<StudentAffairsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("StudentAffairs List"),
      body: Container(
        child:FutureBuilder<List<StudentAffairsModel>>(
          future:StudentAffairsRepository().getAll(),
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
                          title: Text("${list[index].admission},"
                          "${list[index].register},"
                          "${list[index].scheduling}"),
                          subtitle: Text("${list[index].cards},"
                          "${list[index].absenceAndAttendance},"
                          "${list[index].communicationWithParents}"),
                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                          return UpdateStudentAffairs(StudentAffairs: list[index]);
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
                                          return DeleteStudentAffairs(itemId: list[index].id??0,);
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
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddStudentAffairs()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),
    );
  }
}
