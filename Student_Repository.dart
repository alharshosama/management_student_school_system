


import '../Data/db_helper.dart';
import '../Models/StudentModel.dart';

class StudentRepository{
  Future<List<StudentModel>> getAll()async{
    try{
      await Future.delayed(Duration(seconds: 1));
      var res = await DbHelper().getAll(DbTables.Students);
      List<StudentModel> list= [];
      if(res !=null){
        for( var item in res){
          list.add(StudentModel.fromJson(item));
        }
      }
      return list;
    }
    catch(e){
      rethrow;

    }
  }

  Future<int> add(Map<String,dynamic>obj)async{
    try{
      await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().add(DbTables.Students,obj);
      return res;

    }
    catch(e){
      return 0;
    }
  }
  Future<int> update(Map<String,dynamic>obj)async{
    try{
      // await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().update(DbTables.Students,obj);

      return res;

    }
    catch(e){
      print('dbhelper is ${e}');
      return 0;
    }
  }
  Future<int> delete(int id)async{
    try{
      await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().delete(DbTables.Students,id);
      return res;

    }
    catch(e){
      return 0;
    }
  }

  // Future<int> update(int id) async{
  //   try{
  //     var res = await DbHelper().update(DbTables.Students, id as  dynamic);
  //     return res;
  //   }
  //   catch(e){
  //     return 0;
  //   }
  // }


  // Future<int> update(int id)async{
  //   try{
  //     await Future.delayed(Duration(seconds: 1));
  //     //throw Exception();
  //     var res = await DbHelper().update(DbTables.Students,id as Map<String, dynamic>);
  //     return res;
  //
  //   }
  //   catch(e){
  //     return 0;
  //   }
  // }


}







