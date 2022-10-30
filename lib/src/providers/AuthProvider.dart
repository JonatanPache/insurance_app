import 'package:flutter/material.dart';
import 'package:insurance_app/src/api/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  String token;
  ApiService apiService;

  AuthProvider(){
    init();
  }
  Future<void> init() async{
    this.token=await getToken();
    if(this.token.isNotEmpty){
      this.isAuthenticated=true;
    }else{
      this.isAuthenticated=false;
    }
    this.apiService = new ApiService(this.token);
    notifyListeners();
  }
/*
  Future<void> register(String name, String email, String password,
      String passwordConfirm, String device_name) async {
    this.token = await apiService.register(
        name, email, password, passwordConfirm, device_name);
    setToken(this.token);
    this.isAuthenticated = true;
    notifyListeners();
  }*/

  Future<void> login(String email, String password,String device_name) async {
    this.token = await apiService.login(email, password,device_name);
    this.isAuthenticated = true;
    setToken(this.token);
    notifyListeners();
  }

  Future<void> logout() async {
    this.token = '';
    setToken(this.token);
    this.isAuthenticated = false;
    notifyListeners();
  }

  Future<void> setToken(token ) async {
    final pre= await SharedPreferences.getInstance();
    pre.setString('token', token);
  }

  Future<String> getToken() async {
    final pre= await SharedPreferences.getInstance();
    return pre.getString('token')??'';
  }
}
