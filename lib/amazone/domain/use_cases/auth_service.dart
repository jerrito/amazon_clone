import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/error_handle.dart';
import '../../../constants/utils.dart';
import '../../presentation/manager/user_provider.dart';
import '../../presentation/pages/dash_board.dart';
import '../entities/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../repositories/repo.dart';
class AuthService{
  static const url= Repository.url;
  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
})async{
    try{
     var user=User(
      name:name,
      email:email,
      password:password,
      type:"users",
      token:"",
      id:"",
      address:"");
    http.Response response=await http.post(
        Uri.parse("$url/api/signup"),
    body: user.toJson(),
    headers: <String,String>{
      "Content-Type": "application/json; charset=UTF-8"
    });
    if(!context.mounted)return;
    httpErrorHandle(response: response,
        onSuccess: () {
      showSnack(
        context:context,
        message: "Account successfully created",
      );
        },
        context: context);

    }catch(e){
      showSnack(context: context,
          message: e.toString());
      print(e.toString());
    }

  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  })async{
    try{

      http.Response response=await http.post(
          Uri.parse("$url/api/signin"),
          body: jsonEncode({
            "email":email,
            "password": password
          }),
          headers: <String, String>{
            "Content-Type":"application/json; charset=UTF-8"
          });
      print(response.body);
      if(!context.mounted)return;
      httpErrorHandle(response: response,
          onSuccess: () async{
            SharedPreferences sharedPref=await SharedPreferences.getInstance();
            if(!context.mounted)return;
            Provider.of<UserProvider>(context,listen: false)
                .setUser(response.body);

            await  sharedPref.setString("tokenId",
                jsonDecode(response.body)["token"]);

            if(!context.mounted)return;
            Navigator.pushNamedAndRemoveUntil(context,
              DashBoardScreen.routeName, (route) => false);
          },
          context: context);

    }catch(e){
      showSnack(context: context,
          message: e.toString());
      print(e.toString());
    }

  }

  Future<void> getAndVerifyUser(
      BuildContext context
      )async{
    SharedPreferences sharedPref=
    await SharedPreferences.getInstance();
    String? token=sharedPref.getString("tokenId");
    if(token==null){
      sharedPref.setString("tokenId", "");
    }
    var tokenResponse=await http.post(
      Uri.parse("$url/verify_token"),
      headers: <String, String>{
        "Content-Type":"application/json; charset=UTF-8",
        "tokenId":token!,
      }
      );

    var response=jsonDecode(tokenResponse.body);
    print(response);

    if(response==true){
      http.Response userDataResponse=await http.get(
        Uri.parse("$url/"),
        headers: <String, String>{
          "Content-Type":"application/json; charset=UTF-8",
          "tokenId":token,
        }
        );
      print(userDataResponse.body);
      if(!context.mounted)return;
     var userProvider=Provider.of<UserProvider>(context,listen: false);
         userProvider.setUser(userDataResponse.body);
         print(userProvider.user.toJson());
         print(userProvider.user.token);
    }


  }

}