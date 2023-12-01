



import '../Data/db_helper.dart';
import '../Models/MessageModel.dart';

class MessageRepository{
  Future<List<MessageModel>> getAll()async{
    try{
      await Future.delayed(Duration(seconds: 1));
      var res = await DbHelper().getAll(DbTables.Messages);
      List<MessageModel> list= [];
      if(res !=null){
        for( var item in res){
          list.add(MessageModel.fromJson(item));
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
      var res = await DbHelper().add(DbTables.Messages,obj);
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
      var res = await DbHelper().update(DbTables.Messages,obj);

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
      var res = await DbHelper().delete(DbTables.Messages,id);
      return res;

    }
    catch(e){
      return 0;
    }
  }

}







