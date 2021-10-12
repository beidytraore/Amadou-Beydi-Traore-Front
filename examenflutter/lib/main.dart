import 'package:examenflutter/constants.dart';
import 'package:examenflutter/home.dart';
import 'package:examenflutter/not_found.dart';
import 'package:examenflutter/providers/acte_naiss.dart';
import 'package:examenflutter/providers/auth.dart';
import 'package:examenflutter/providers/user.dart';
import 'package:examenflutter/screens/admin/dashboard.dart';
import 'package:examenflutter/screens/admin/demande_details_encours.dart';
import 'package:examenflutter/screens/admin/demandes_encours.dart';
import 'package:examenflutter/screens/admin/listes_utilisateurs.dart';
import 'package:examenflutter/screens/authentication/forgot_password.dart';
import 'package:examenflutter/screens/authentication/login.dart';
import 'package:examenflutter/screens/authentication/register.dart';
import 'package:examenflutter/screens/listes_actes_naissance/liste.dart';
import 'package:examenflutter/splashScreen.dart';
import 'package:examenflutter/utilisateur/accueil.dart';
import 'package:examenflutter/utilisateur/demande.dart';
import 'package:examenflutter/utilisateur/demande_details_encours.dart';
import 'package:examenflutter/utilisateur/demande_details_traite.dart';
import 'package:examenflutter/utilisateur/demande_encours.dart';
import 'package:examenflutter/utilisateur/demande_traite.dart';
import 'package:examenflutter/utilisateur/formulaire.dart';
import 'package:examenflutter/utilisateur/profil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Mairie());
}

class Mairie extends StatefulWidget {
  @override
  _OgiiState createState() => _OgiiState();
}

class _OgiiState extends State<Mairie> {

  final AuthProvider authProvider = AuthProvider();
  final ActeApiProvider acteApiProvider = ActeApiProvider();
  final UserProvider userProvider = UserProvider();
  
  @override
  void initState() {
    initauthAsync().then((value) => {});
    super.initState();
  }

  Future<void> initauthAsync() async {
    await authProvider.initAuth();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: authProvider,
        ),
        ChangeNotifierProxyProvider<AuthProvider, ActeApiProvider>(
            create: (_) => ActeApiProvider(),
            update: (_, authProvider, oldActeProvider) {
              oldActeProvider.update(authProvider);
              return oldActeProvider;
            }),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
            create: (_) => UserProvider(),
            update: (_, authProvider, oldUserProvider) {
              oldUserProvider.update(authProvider);
              return oldUserProvider;
            }),
      ],
      child: MaterialApp(
        title: 'Mairie',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: SplashView(),
        onGenerateRoute: (settings) {
          if (settings.name == Login.rootName) {
            return MaterialPageRoute(builder: (_) => Login());
          } else if (settings.name == HomeViewScreen.rootName) {
            return MaterialPageRoute(builder: (_) => HomeViewScreen());
          } else if (settings.name == ListActeView.rootName) {
            return MaterialPageRoute(builder: (_) => ListActeView());
          } else if (settings.name == Accueil.rootName) {
            return MaterialPageRoute(builder: (_) => Accueil());
          } else if (settings.name == Demande.rootName) {
            return MaterialPageRoute(builder: (_) => Demande());
          } else if (settings.name == Profil.rootName) {
            return MaterialPageRoute(builder: (_) => Profil());
          } else if (settings.name == FormDemande.rootName) {
            return MaterialPageRoute(builder: (_) => FormDemande());
          } else if (settings.name == ForgetPassword.rootName) {
            return MaterialPageRoute(builder: (_) => ForgetPassword());
          } else if (settings.name == Register.rootName) {
            return MaterialPageRoute(builder: (_) => Register());
          } else if (settings.name == DemandeEnCours.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeEnCours());
          } else if (settings.name == DemandeTraite.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeTraite());
          } else if (settings.name == DetailDemandeEncours.rootName) {
            return MaterialPageRoute(builder: (_) => DetailDemandeEncours());
          } else if (settings.name == DetailDemandeTraites.rootName) {
            return MaterialPageRoute(builder: (_) => DetailDemandeTraites());
          } else if (settings.name == DashboardAdmin.rootName) {
            return MaterialPageRoute(builder: (_) => DashboardAdmin());
          } else if (settings.name == DemandeEncoursAdmin.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeEncoursAdmin());
          } else if (settings.name == ListUserView.rootName) {
            return MaterialPageRoute(builder: (_) => ListUserView());
          } else if (settings.name == DetailDemandeEncoursAdmin.rootName) {
            return MaterialPageRoute(
                builder: (_) => DetailDemandeEncoursAdmin());
          }

          return null;
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => NotFoundView(),
        ),
      ),
    );
  }
}


