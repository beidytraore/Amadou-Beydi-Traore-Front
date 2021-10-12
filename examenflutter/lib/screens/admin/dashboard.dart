import 'package:examenflutter/models/user.dart';
import 'package:examenflutter/screens/admin/demande_traites.dart';
import 'package:examenflutter/screens/admin/demandes_encours.dart';
import 'package:examenflutter/screens/admin/listes_utilisateurs.dart';
import 'package:examenflutter/utilisateur/profil.dart';
import 'package:examenflutter/utilisateur/settings.dart';
import 'package:flutter/material.dart';

class DashboardAdmin extends StatefulWidget {
  static String rootName = "/dashboardAdmin";
  final User user;
  const DashboardAdmin({Key key, this.user}) : super(key: key);

  @override
  _DashboardAdminState createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("DashBoard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.yellow,
              size: 30.8,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        color: Colors.indigo,
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              color: Colors.indigo.shade300,
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DemandeEncoursAdmin(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.orangeAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.hourglass_top_outlined,
                        size: 50,
                      ),
                      Text(
                        "En cours",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade300,
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DemandeTraiteAdmin(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.orangeAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.hourglass_bottom,
                        size: 50,
                      ),
                      Text(
                        "Traité",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade300,
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListUserView(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.orangeAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: 50,
                      ),
                      Text(
                        "Users",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade300,
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profil(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.orangeAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.person_pin,
                        size: 50,
                      ),
                      Text(
                        "Profil",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade300,
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ),
                  );
                },
                splashColor: Colors.orangeAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        size: 50,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.number});
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.orangeAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                number,
                style: TextStyle(fontSize: 50.0),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
