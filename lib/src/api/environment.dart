import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:insurance_app/src/models/Poliza.dart';

class ApiService{
  String token;

  ApiService(String token){
    this.token=token;
  }

  //final String baseUrl='http://10.0.2.2:8000/api/';
  final String baseUrl='http://ec2-52-87-213-140.compute-1.amazonaws.com/api/';

  Future<List<Poliza>> fetchPolizas() async {
    http.Response response = await http.get(Uri.parse(baseUrl+'categories'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:'Baerer $token'
      },
    );
    List categories = jsonDecode(response.body);
    print(response.body);
    return categories.map((category) => Poliza.fromJson(category)).toList();
  }
/*
  Future<Category> addCategory(String name) async {
    String uri = baseUrl+'categories';
    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({'name': name})
    );
    if(response.statusCode!=201){
      throw Exception('Error en created category api');
    }
    return Category.fromJson(jsonDecode(response.body));
  }

  Future<Category> updateCategory(Category category) async {
    String uri =
        baseUrl+'categories/' + category.id.toString();
    http.Response response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({'name': category.name})
    );
    if(response.statusCode!=200){
      throw Exception('Error en update category api');
    }
    return Category.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteCategory(id) async {
    String uri =
        baseUrl+'categories/' + id.toString();
    http.Response response = await http.delete(Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:'Bearer $token'
      },
    );
    if(response.statusCode!=204){
      throw Exception('Error en delete  category');
    }
  }

  Future<String> register(String name, String email, String password,
      String passwordConfirm, String device_name) async {
    String uri = baseUrl+'auth/register';
    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: jsonEncode({
          'name': name,
          'email':email,
          'password':password,
          'password_confirmation':passwordConfirm,
          'device_name':device_name
        })
    );
    if(response.statusCode==422){
      Map<String,dynamic> body=jsonDecode(response.body);
      Map<String,dynamic> errors=body['errors'];
      String errorMessage='';
      errors.forEach((key, value) {
        value.forEach((element){
          errorMessage+=element+'\n';
        });
      });
      throw Exception(errorMessage);
    }
    return response.body;
  }
*/
  Future<String> login(String email, String password, String device_name) async {
    String uri = baseUrl+'auth/login';
    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: jsonEncode({
          'email':email,
          'password':password,
          'device_name':device_name
        })
    );
    if(response.statusCode==422){
      Map<String,dynamic> body=jsonDecode(response.body);
      Map<String,dynamic> errors=body['errors'];
      String errorMessage='';
      errors.forEach((key, value) {
        value.forEach((element){
          errorMessage+=element+'\n';
        });
      });
      throw Exception(errorMessage);
    }
    return response.body;
  }
}