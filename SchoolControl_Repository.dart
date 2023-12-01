



import '../Data/db_helper.dart';
import '../Models/SchoolControlModel.dart';

class SchoolControlRepository{
  Future<List<SchoolControlModel>> getAll()async{
    try{
      await Future.delayed(Duration(seconds: 1));
      var res = await DbHelper().getAll(DbTables.Controls);
      List<SchoolControlModel> list= [];
      if(res !=null){
        for( var item in res){
          list.add(SchoolControlModel.fromJson(item));
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
      var res = await DbHelper().add(DbTables.Controls,obj);
      return res;

    }
    catch(e){
      return 0;
    }
  }
  Future<int> update(Map<String,dynamic>obj)async{
    try{
      await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().update(DbTables.Controls,obj);

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
      var res = await DbHelper().delete(DbTables.Controls,id);
      return res;

    }
    catch(e){
      return 0;
    }
  }

}







