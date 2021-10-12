import 'package:examenflutter/models/acte_naissance.dart';
import 'package:examenflutter/models/user.dart';
import 'package:flutter/material.dart';

class DetailDemandeTraitesAdmin extends StatefulWidget {
  static String rootName = "/detailsDemandeTraitesAdmin";

  final User user;
  final ActeNaiss acteNaiss;

  const DetailDemandeTraitesAdmin({Key key, this.user, this.acteNaiss})
      : super(key: key);

  @override
  _DetailDemandeTraitesAdminState createState() =>
      _DetailDemandeTraitesAdminState();
}

class _DetailDemandeTraitesAdminState extends State<DetailDemandeTraitesAdmin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Details de l acte de naissance Acte N° " + widget.acteNaiss.id.toString()),
          backgroundColor: Colors.black54,
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
                                                fontSize: 16,
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
                                                fontSize: 16,
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
                                                fontSize: 16,
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
                                                fontSize: 16,
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
                                                fontSize: 16,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Nom du Pere ",
                                  style: TextStyle(
                                    fontSize: 16,
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
                                                fontSize: 16,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom du Pere ",
                                  style: TextStyle(
                                    fontSize: 16,
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
                                                fontSize: 16,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Proffession Pere ",
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
                                                fontSize: 16,
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
                                                fontSize: 16,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom mere ",
                                  style: TextStyle(
                                    fontSize: 16,
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
                                                fontSize: 16,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Proffession de la mere ",
                                  style: TextStyle(
                                    fontSize: 16,
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
                                                fontSize: 16,
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
