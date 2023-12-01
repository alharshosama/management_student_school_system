// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:management_student/widget/coustom_appar.dart';
// import 'package:management_student/widget/coustom_drawer.dart';
//
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: CoursesPage(),
//   );
// }
//
//
// List<String> courses = [
//   'Mathematics',
//   'Science',
//   'History',
//   'English',
//   'Biology',
//   'chemistry',
//   'physics',
//   'Arabic Language',
//   'Islamic',
//   'The Holy Quran',
//   // Add more courses as needed
// ];
// class CoursesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(context),
//
//       appBar: CustomAppbar("Courses"),
//       body: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(courses[index]),
//             trailing: Icon(Icons.arrow_forward),
//             onTap: () {
//               // Add logic to navigate to the course details page
//
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/Courses/delete_courses_view.dart';
import 'package:management_student/Courses/update_courses_view.dart';
import 'package:management_student/Models/CoursesModel.dart';
import 'package:management_student/repositories/Courses_Repository.dart';

import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'Add_courses_view.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Courses List"),
      body: Container(
        child:FutureBuilder<List<CoursesModel>>(
          future:CoursesRepository().getAll(),
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
                          subtitle: Text("${list[index].details}"),

                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                         // return UpdateCourses(Id: list[index].id??0,);
                                          return UpdateCourses(courses:list[index]);

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
                                          return DeleteCourses(itemId: list[index].id??0,);
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
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCourses()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),
    );
  }
}
