
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/Student/update_student_view.dart';

import '../Models/StudentModel.dart';
import '../repositories/Student_Repository.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'add_student_view.dart';
import 'delete_student_view.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Student List"),
      body: Container(
        child:FutureBuilder<List<StudentModel>>(
          future:StudentRepository().getAll(),
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
                          title: Text("${list[index].name}"),
                          subtitle: Text("${list[index].level}"),
                          trailing:
                        SizedBox(
                          height: 20,
                          width: 100,
                          child:   Row(
                              children: [
                                IconButton(
                                  onPressed: ()async{
                                    var updaRes= await showDialog(context: context, builder: (context){
                                     print(list[index].id);
                                     // return UpdateStudentPage(Id: list[index].id??0,);
                                     return UpdateStudentPage(student: list[index],);

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
                                      return DeleteStudent(itemId: list[index].id??0,);
                                    });
                                    if(delRes !=null && delRes ==true){
                                      setState(() {

                                      });
                                    }
                                  },
                                  icon: const Icon(
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
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddStudent()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),




    );

  }
}

