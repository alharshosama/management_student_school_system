// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:management_student/widget/coustom_appar.dart';
// import 'package:management_student/widget/coustom_drawer.dart';
//
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: PersonnelPage(),
//   );
// }
//
//
// class PersonnelPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(context),
//       appBar: CustomAppbar("Personnel Affairs Department"),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Personnel',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             _buildPersonnelItem('John Doe', 'Manager'),
//             _buildPersonnelItem('Jane Smith', 'Assistant'),
//             _buildPersonnelItem('John Doe', 'Manager'),
//             _buildPersonnelItem('Jane Smith', 'Assistant'),
//             _buildPersonnelItem('John Doe', 'Manager'),
//             _buildPersonnelItem('Jane Smith', 'Assistant'),
//             _buildPersonnelItem('John Doe', 'Manager'),
//             _buildPersonnelItem('Jane Smith', 'Assistant'),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPersonnelItem(String name, String position) {
//     return ListTile(
//       title: Text(name),
//       subtitle: Text('Position: $position'),
//       trailing: IconButton(
//         icon: Icon(Icons.person),
//         onPressed: () {
//           // Add logic to view personnel details
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/%20Personnel/update_Personnel_view.dart';
import 'package:management_student/repositories/Personnel_Repository.dart';

import '../Models/PersonnelModel.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'add_Personnel_view.dart';
import 'delete_Personnel_view.dart';

class PersonnelPage extends StatefulWidget {
  const PersonnelPage({Key? key}) : super(key: key);

  @override
  State<PersonnelPage> createState() => _PersonnelPageState();
}

class _PersonnelPageState extends State<PersonnelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Personnel Affairs Department"),
      body: Container(
        child:FutureBuilder<List<PersonnelModel>>(
          future:PersonnelRepository().getAll(),
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
                          subtitle: Text("${list[index].position}"),
                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                          return UpdatePersonnel(Personnel: list[index]);
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
                                          return DeltetPersonnel(itemId: list[index].id??0,);
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
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddPersonnel()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),
    );
  }
}
