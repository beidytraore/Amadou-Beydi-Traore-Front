import 'package:examenflutter/models/user.dart';
import 'package:examenflutter/providers/auth.dart';
import 'package:examenflutter/responses/response_generic.dart';
import 'package:examenflutter/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User user;
  AuthProvider authProvider;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  void updateUser(User updateUser) {
    user = updateUser;
    notifyListeners();
  }

  void update(AuthProvider newauthProvider) async {
    authProvider = newauthProvider;
    user = newauthProvider.user;
    if (user == null && authProvider.isLoggedin) {
      var currentuser = await fetchCurrentUser();
      updateUser(currentuser);
    }
  }

  Future<User> fetchCurrentUser() async {
    try {
      ResponseGeneric response =
          await ApiService.getAction("api/getallLogin", authProvider.token);
      // final ResponseLogin responseLogin = ResponseLogin.fromJson(responseGeneric.data);
      if (response != null) {
        // updateUser(User.fromJson(response.data));
        return User.fromJson(response.data);
      } else {
        throw Exception('error status code');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ListUsers> getUserData() async {
    ResponseGeneric response =
        await ApiService.getAction("api/", authProvider.token);

    if (response != null) {
      return ListUsers.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<User> addDataUser(User user) async {
    ResponseGeneric response = await ApiService.postAction(
        user.toJson(), "api/addLogin", authProvider.token);

    if (response != null) {
      return User.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }
}
