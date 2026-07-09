import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite_offline/data/storage/local_storage.dart';

class SharedPreferencesStorage implements LocalStorage{

  Future<SharedPreferences> getInstance() async {
    final instance = await SharedPreferences.getInstance();
    return instance;
  }

  @override
  Future<bool> create<T>({required String key, required T data}) async {
    final instance = await getInstance();
    
    if (data is String){
      return instance.setString(key, data);
    } else if (data is int){
      return instance.setInt(key, data);
    } else if (data is double){
      return instance.setDouble(key, data);
    } else if (data is bool){
      return instance.setBool(key, data);
    } else if (data is List<String>){
      return instance.setStringList(key, data);
    } else {
      log('Tipo inválido');
      return false;
    }
  }

  @override
  Future<bool> delete({required String key}) async {
    final instance = await getInstance();
    return instance.remove(key);
  }

  @override
  Future<T?> getData<T>({required String key}) async {
    final instance = await getInstance();
    return instance.get(key) as T?;
  }

}