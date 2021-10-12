import 'package:examenflutter/models/acte_naissance.dart';
import 'package:examenflutter/models/user.dart';
import 'package:examenflutter/providers/acte_naiss.dart';
import 'package:examenflutter/screens/admin/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class DetailDemandeEncoursAdmin extends StatefulWidget {
  static String rootName = "/detailsDemandeEncoursAdmin";

  final User user;
  final ActeNaiss acteNaiss;

  const DetailDemandeEncoursAdmin({Key key, this.user, this.acteNaiss})
      : super(key: key);

  @override
  _DetailDemandeEncoursAdminState createState() =>
      _DetailDemandeEncoursAdminState();
}

class _DetailDemandeEncoursAdminState extends State<DetailDemandeEncoursAdmin> {
  Future<void> changeState() async {
    ActeNaiss acteNaiss = ActeNaiss();
    acteNaiss.firstName = widget.acteNaiss.firstName;
    acteNaiss.user_id = widget.acteNaiss.user_id;
    acteNaiss.lastName = widget.acteNaiss.lastName;
    acteNaiss.firstNameFather = widget.acteNaiss.firstNameFather;
    acteNaiss.lastNameFather = widget.acteNaiss.lastNameFather;

    acteNaiss.firstNameMother = widget.acteNaiss.firstNameMother;
    acteNaiss.lastNameMother = widget.acteNaiss.lastNameMother;
    acteNaiss.address = widget.acteNaiss.address;
    acteNaiss.motherJob = widget.acteNaiss.motherJob;
    acteNaiss.fatherJob = widget.acteNaiss.fatherJob;
    acteNaiss.dateBorn = widget.acteNaiss.dateBorn;
    acteNaiss.commune = widget.acteNaiss.commune;

    final ActeNaiss responseActe =
        await Provider.of<ActeApiProvider>(context, listen: false)
            .updateActe(widget.acteNaiss.id, acteNaiss);

    if (responseActe != null) {
      Toast.show("L acte de naissance mise a jour avec succes", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.orangeAccent);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardAdmin(
            user: widget.user,
          ),
        ),
      );
    } else {
      setState(() {
        //message = "Erreur produite lors de l'enregistrement";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Details de l acte de naissance N°  " + widget.acteNaiss.id.toString()),
          backgroundColor: Colors.black54,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.update,
                color: Colors.white,
                size: 30.8,
              ),
              onPressed: changeState,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "Nom",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 200,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.firstName,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 200,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.lastName,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Date de Naissance ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.dateBorn,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Commune ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.commune,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Adresse ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.address,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Nom Pere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.lastNameFather,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom Pere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.firstNameFather,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Proffession du Pere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.fatherJob,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Nom de la Mere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.lastNameMother,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom de la mere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.firstNameMother,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Profession de la mere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acteNaiss.motherJob,
                                              style: TextStyle(
                                                color: Colors.orangeAccent[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget lineSection = Container(
  color: Colors.grey[200],
  padding: EdgeInsets.all(4),
);
