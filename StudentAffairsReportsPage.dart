
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/StudentAffairsReports/update_StudentAffairsReports_view.dart';
import 'package:management_student/repositories/Student_Report_Repository.dart';

import '../Models/StudentReportModel.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'add_studen_report_view.dart';
import 'delete_student_reports_view.dart';

class StudentAffairsReportsPage extends StatefulWidget {
  const StudentAffairsReportsPage({Key? key}) : super(key: key);

  @override
  State<StudentAffairsReportsPage> createState() => _StudentAffairsReportsPageState();
}

class _StudentAffairsReportsPageState extends State<StudentAffairsReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("StudentAffairsReports List"),
      body: Container(
        child:FutureBuilder<List<StudentReportModel>>(
          future:StudentReportRepository().getAll(),
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
                          title: Text("${list[index].performance},"
                          "${list[index].attendanceAndAbsenceReport},"
                          "${list[index].disciplineAndConductReport}"),
                          subtitle: Text("${list[index].personalDevelopmentReport},"
                          "${list[index].homeLinkageReport},"
                          "${list[index].testReportsAndevaluation}"),
                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                          return UpdateStudentAffairsReports(StudentReport: list[index]);
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
                                          return DeleteStudentAffairsReports(itemId: list[index].id??0,);
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
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddStudentAffairsReports()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),
    );
  }
}
