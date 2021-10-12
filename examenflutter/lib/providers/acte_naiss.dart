import 'package:examenflutter/models/acte_naissance.dart';
import 'package:examenflutter/providers/auth.dart';
import 'package:examenflutter/responses/response_generic.dart';
import 'package:examenflutter/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ActeApiProvider with ChangeNotifier {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  AuthProvider authProvider;
  ActeNaiss acteNaiss;

  void update(AuthProvider newauthProvider) async {
    authProvider = newauthProvider;
  }

  Future<ListActe> getBakeryData() async {
    ResponseGeneric response =
        await ApiService.getAction("api/", authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ActeNaiss> GetActeById(int id) async {
    ResponseGeneric response = await ApiService.getAction(
        "api/" + id.toString(), authProvider.token);

    if (response != null) {
      return ActeNaiss.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeEncourByUserId(int id) async {
    ResponseGeneric response = await ApiService.getAction(
        "api/" + id.toString(), authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeTraiteByUserId(int id) async {
    ResponseGeneric response = await ApiService.getAction(
        "api/" + id.toString(), authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeTraite() async {
    ResponseGeneric response =
        await ApiService.getAction("/api", authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeEncours() async {
    ResponseGeneric response =
        await ApiService.getAction("/", authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ActeNaiss> addDataActe(ActeNaiss acteNaiss) async {
    ResponseGeneric response = await ApiService.postAction(
        acteNaiss.toJson(), "api/AjouterActeNaissance", authProvider.token);

    if (response != null) {
      return ActeNaiss.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ActeNaiss> updateActe(int id, ActeNaiss acteNaiss) async {
    ResponseGeneric response = await ApiService.puAction(
        acteNaiss.toJson(), "api/updateActeNaissance" + id.toString(), authProvider.token);

    if (response != null) {
      return ActeNaiss.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }
}
