import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/models/user.dart';
class UserProvider extends ChangeNotifier{

 User _user=User(email: '', password: '', id: '',
     type: '', address: '', token: '', name: '');


  User get user => _user;

void setUser(String user){
  print(user);
  _user=User.fromJson(user);
  notifyListeners();
}



}

class CustomerProvider extends ChangeNotifier {
  final SharedPreferences? preferences;
  //final firebaseService = FirebaseServices();

  CustomerProvider({required this.preferences}) {
    var appUserString = preferences?.getString("app_user") ?? '';
    _appUser = appUserString.isNotEmpty ? User.fromJson(appUserString) : null;
  }

  User? _appUser;
  User? get appUser => _appUser;

  set appUser(User? a) {
    _appUser = a;
    notifyListeners();

    preferences?.setString(
      "app_user",
      a?.toString() ?? '',
    );
  }
  User? _user;
  User? get user => _user;
  void setUser(String user){
    print(user);
    _user=User.fromJson(user);
    notifyListeners();
    preferences?.setString(
      "app_user",
      user.toString() ?? '',
    );
  }

  // Future<QueryResult<User>?>? getUser({required String email})
  // async {
  //   var result = await firebaseService.getUser(phoneNumber: email);
  //
  //   if (result?.status == QueryStatus.successful && result?.data != null) {
  //     appUser = result?.data;
  //   }
  //
  //   return result;
  // }




}
