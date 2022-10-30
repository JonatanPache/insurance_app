import 'package:flutter/material.dart';

class LoginController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  /*UserProvider _userProvider = new UserProvider();
  ClienteProvider _clienteProvider=new ClienteProvider();
  TecnicoProvider _tecnicoProvider=new TecnicoProvider();
  SharedPref _sharePref = new SharedPref();
  TipoUserProvider _tipoUserProvider=new TipoUserProvider();
  List<TipoUser> tipoUserList=[];
  String tipoUser; // almacena el tipo de usuario
  Function refresh;*/

  Future init(BuildContext context,Function refresh) async {
    this.context=context;
    /*this.refresh=refresh;
    Users users=Users.fromJson(await _sharePref.read('users') ?? {});
    print('usuario: ${users.toJson()}');
    await _userProvider.init(context);
    _tipoUserProvider.init(context);
    getTipoUser();
    if(users?.sessionToken!=null){
      Navigator.pushNamedAndRemoveUntil(context,'clientes/dashboard', (route) => false);
    }*/
  }

  void getTipoUser() async{
    /*tipoUserList=await _tipoUserProvider.getAll();
    refresh();*/
  }

  /*void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi;
    if(tipoUser!=null && tipoUser=='1'){
      //administrador
      responseApi = await _userProvider.login(email, password);
      print('Respuesta admin: ${responseApi}');
      print('Respuesta  ${responseApi.toJson()}');
      MySnackbar.show(context, responseApi.message);
      if (responseApi.success) {
        Users user = Users.fromJson(responseApi.data);
        _sharePref.save('user', user.toJson());
        print('Usuario logeado:  ${user.toJson()}');
        Navigator.pushNamedAndRemoveUntil(context, 'admin/dashboard', (route) => false);
      } else {
        MySnackbar.show(context, responseApi.message);
      }
    }else{//cliente
      if(tipoUser!=null && tipoUser=='2'){
        responseApi = await _clienteProvider.login(email, password);
        print('Respuesta cliente: ${responseApi}');
        print('Respuesta  ${responseApi.toJson()}');
        MySnackbar.show(context, responseApi.message);
        if (responseApi.success) {
          Cliente cliente = Cliente.fromJson(responseApi.data);
          _sharePref.save('cliente', cliente.toJson());
          print('Cliente logeado:  ${cliente.toJson()}');
          var client=await _sharePref.read('cliente');
          print('share saving: '+ client.toString());
          Navigator.pushNamedAndRemoveUntil(context, 'cliente/dashboard', (route) => false);
        } else {
          MySnackbar.show(context, responseApi.message);
        }
      }else{//tecnico
        if(tipoUser!=null && tipoUser=='3'){
          responseApi = await _tecnicoProvider.login(email, password);
          print('Respuesta tecnico: ${responseApi}');
          print('Respuesta  ${responseApi.toJson()}');
          MySnackbar.show(context, responseApi.message);
          if (responseApi.success) {
            Tecnico tec = Tecnico.fromJson(responseApi.data);
            _sharePref.save('tecnico', tec.toJson());
            print('Tecnico logeado:  ${tec.toJson()}');
            var tecn=await _sharePref.read('tecnico');
            print('share saving: '+ tecn.toString());
            Navigator.pushNamedAndRemoveUntil(context, 'tecnico/dashboard', (route) => false);
          } else {
            MySnackbar.show(context, responseApi.message);
          }
        }

      }
    }

  }*/

}
