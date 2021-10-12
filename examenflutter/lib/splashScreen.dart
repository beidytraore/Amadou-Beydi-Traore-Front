import 'package:examenflutter/home.dart';
import 'package:examenflutter/menu_admin.dart';
import 'package:examenflutter/models/user.dart';
import 'package:examenflutter/providers/auth.dart';
import 'package:examenflutter/providers/user.dart';
import 'package:examenflutter/screens/authentication/login.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static String rootName = "/";
  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = Provider.of<AuthProvider>(context).isLoggedin;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (isLoggedIn == false) {
        Navigator.pushReplacementNamed(context, Login.rootName);
      } else if (isLoggedIn == true) {
        //Selon le profil l utilisateur sera redirigé sur une page dediee

        final User user =
            Provider.of<UserProvider>(context, listen: false).user;

        if (user != null) {
          if (user.roleId == 1) //Responsable
          {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeViewScreen(user: user),
              ),
            );
          } else if (user.roleId == 2) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MenuAdmin(user: user),
              ),
            );
          } else {
            //une autre page ( impossible de recuperer le user du provider et storage)
            //    Navigator.pushReplacementNamed(context, UserNotFoundView.rootName);
          }
        }
      }
    });

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: Text(
          "Ogii",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
