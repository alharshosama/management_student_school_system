// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:management_student/widget/coustom_appar.dart';
// import 'package:management_student/widget/coustom_drawer.dart';
//
//
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home:AccountManagementPage(),
//   );
// }
//
// class AccountManagementPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(context),
//       appBar:CustomAppbar("Account Management"),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Accounts',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             _buildAccountItem('John Doe', 'john.doe@example.com'),
//             _buildAccountItem('Jane Smith', 'jane.smith@example.com'),
//             _buildAccountItem('osama alharsh', 'osama.alharsh@example.com'),
//             _buildAccountItem('Jane Smith', 'jane.smith@example.com'),
//             _buildAccountItem('Jane Smith', 'jane.smith@example.com'),
//             _buildAccountItem('Jane Smith', 'jane.smith@example.com'),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAccountItem(String name, String email) {
//     return ListTile(
//       title: Text(name),
//       subtitle: Text(email),
//       trailing: IconButton(
//         icon: Icon(Icons.edit),
//         onPressed: () {
//           // Add logic to edit account details
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_student/%20AccountManagement/update_AccountManagement_view.dart';
import 'package:management_student/repositories/AccountManagement_Repository.dart';

import '../Models/accountmanagementModel.dart';
import '../widget/coustom_appar.dart';
import '../widget/coustom_drawer.dart';
import 'add_manager_account_view.dart';
import 'delete_manager_account_view.dart';

class AccountManagementPage extends StatefulWidget {
  const AccountManagementPage({Key? key}) : super(key: key);

  @override
  State<AccountManagementPage> createState() => _AccountManagementPageState();
}

class _AccountManagementPageState extends State<AccountManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Account Management"),
      body: Container(
        child:FutureBuilder<List<AccountmanagementModel>>(
          future:AccountManagementRepository().getAll(),
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
                          title: Text("${list[index].name},"
                              "${list[index].email}"),
                          subtitle: Text("${list[index].password},"
                          "${list[index].positions}"),
                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                          return UpdateAccountManagement(Accountmanagement: list[index]);
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
                                          return DeleteManagerAccount(itemId: list[index].id??0,);
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
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddManagerAccount()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),
    );
  }
}
