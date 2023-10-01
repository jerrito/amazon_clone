import 'dart:convert';

class User{
 final String name;
 final  String email;
 final  String password;
 final  String id;
 final  String type;
 final   String address;
 final   String token;
  User({required this.email, required this.password,
    required this.id, required this.type,
    required this.address, required this.token,
      required this.name});

  Map<String, dynamic> toMap(){
    return{
      "email":email,
      "name":name,
      "password":password,
      "token":token,
      "id":id,
      "address":address,
      "type":type,
    };
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      id:map["_id"] ?? "",
      email:map["email"] ?? "",
      password:map["password"] ?? "",
      name:map["name"] ?? "",
      token:map["token"] ?? "",
      address:map["address"] ?? "",
      type:map["type"] ?? "",

    );
  }
  String toJson()=> json.encode(toMap());

  factory User.fromJson(String source)=>
      User.fromMap(json.decode(source));




}