import 'package:examenflutter/models/user.dart';

class ActeNaiss {
  String commune;
  String firstName;
  String lastName;
  String firstNameFather;
  String fatherJob;
  String lastNameFather;
  String firstNameMother;
  String lastNameMother;
  String motherJob;
  String dateBorn;
  String address;
  int state;
  String updatedAt;
  String createdAt;
  int id;
  int user_id;
  User user;

  ActeNaiss(
      {this.commune,
      this.firstName,
      this.lastName,
      this.firstNameFather,
      this.lastNameFather,
      this.firstNameMother,
      this.lastNameMother,
      this.fatherJob,
      this.motherJob,
      this.dateBorn,
      this.address,
      this.state,
      this.updatedAt,
      this.createdAt,
      this.user_id,
      this.user,
      this.id});

  ActeNaiss.fromJson(Map<String, dynamic> json) {
    commune = json['commune'];
    firstName = json['firstname'];
    lastName = json['lastname'];
    firstNameFather = json['firstnamefather'];
    lastNameFather = json['lastnamefather'];
    firstNameMother = json['firstnamemother'];
    lastNameMother = json['lastnamemother'];
    fatherJob = json['fatherjob'];
    motherJob = json['motherjob'];
    dateBorn = json['dateborn'];
    address = json['address'];
    state = json['state'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    user_id = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commune'] = this.commune;
    data['firstname'] = this.firstName;
    data['lastname'] = this.lastName;
    data['firstnamefather'] = this.firstNameFather;
    data['lastnamefather'] = this.lastNameFather;
    data['firstnamemother'] = this.firstNameMother;
    data['lastnamemother'] = this.lastNameMother;
    data['fatherjob'] = this.fatherJob;
    data['motherjob'] = this.motherJob;
    data['dateborn'] = this.dateBorn;
    data['address'] = this.address;
    data['state'] = this.state;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }

    return data;
  }
}

class ListActe {
  List<ActeNaiss> data;

  ListActe({this.data});

  ListActe.fromJson(dynamic json) {
    if (json != null) {
      data = <ActeNaiss>[];
      json.forEach((v) {
        data.add(new ActeNaiss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
