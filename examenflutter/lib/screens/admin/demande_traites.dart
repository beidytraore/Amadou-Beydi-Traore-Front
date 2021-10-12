import 'package:examenflutter/loading/loading.dart';
import 'package:examenflutter/models/acte_naissance.dart';
import 'package:examenflutter/models/user.dart';
import 'package:examenflutter/providers/acte_naiss.dart';
import 'package:examenflutter/screens/admin/demande_traites_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemandeTraiteAdmin extends StatefulWidget {
  static String rootName = "/demande_traite_admin";
  final User user;

  DemandeTraiteAdmin({Key key, this.user}) : super(key: key);

  @override
  _DemandeTraiteAdminState createState() => _DemandeTraiteAdminState();
}

class _DemandeTraiteAdminState extends State<DemandeTraiteAdmin> {
  ListActe listActes = ListActe();
  User user;

  void initState() {
    listActes.data = <ActeNaiss>[];
    super.initState();
  }

  Future<List<ActeNaiss>> getActeTraiteAdmin() async {
    var data = await Provider.of<ActeApiProvider>(context, listen: false)
        .GetActeTraite();
    listActes = data;
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demande Traité"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<ActeNaiss>> listActes) {
        if (!listActes.hasData) {
          return Container(
            child: Center(child: Loading()),
          );
        }
        return ListView.builder(
          itemCount: listActes.data.length,
          itemBuilder: (context, index) {
            return getCard(listActes.data[index]);
          },
        );
      },
      future: getActeTraiteAdmin(),
    );
  }

  Widget getCard(ActeNaiss acteNaiss) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailDemandeTraitesAdmin(
              user: user,
              acteNaiss: acteNaiss,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 10,
        child: Row(
          children: [
            Image.asset(
              "assets/logo.jpg",
              width: 100,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Acte de naissance N° ${acteNaiss.id}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${acteNaiss.user?.firstName}  ${acteNaiss.user?.lastName}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Traité avec succès",
                    style: TextStyle(fontSize: 18.0, color: Colors.orangeAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
