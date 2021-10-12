import 'package:examenflutter/models/user.dart';
import 'package:examenflutter/screens/admin/dashboard.dart';
import 'package:examenflutter/utilisateur/accueil.dart';
import 'package:examenflutter/utilisateur/profil.dart';
import 'package:examenflutter/utilisateur/settings.dart';
import 'package:flutter/material.dart';

class MenuAdmin extends StatefulWidget {
  
  static String rootName = "/menu_admin";
  final User user;
  const MenuAdmin({Key key, this.user}) : super(key: key);

  @override
  _MenuAdminState createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  int currentTab = 0;
  final List<Widget> screens = [
    Profil(),
    Accueil(),
    DashboardAdmin(),
    Settings()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Accueil();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Accueil(user: widget.user);
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: currentTab == 0 ? Colors.blueGrey : Colors.grey,
                        ),
                        Text(
                          "Accueil",
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blueGrey : Colors.green),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DashboardAdmin(user: widget.user);
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 1 ? Colors.blueGrey : Colors.grey,
                        ),
                        Text(
                          "Dashbord",
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blueGrey : Colors.green),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Right tab Bar
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profil(user: widget.user);
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: currentTab == 2 ? Colors.blueGrey : Colors.blueGrey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blueGrey : Colors.tealAccent),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Settings();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.blueGrey : Colors.tealAccent,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blueGrey : Colors.tealAccent),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
