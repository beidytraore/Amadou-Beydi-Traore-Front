import 'package:examenflutter/models/signin_form.dart';
import 'package:examenflutter/providers/auth.dart';
import 'package:examenflutter/responses/response_login.dart';
import 'package:examenflutter/screens/authentication/forgot_password.dart';
import 'package:examenflutter/screens/authentication/register.dart';
import 'package:examenflutter/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  static String rootName = "/login";
  static String tag = 'login-page';
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  SigninForm signinForm;
  bool hiddenpwd = true;
  String message = "";

  @override
  void initState() {
    signinForm = SigninForm(phone: "", password: "");
    super.initState();
  }

  FormState get form => key.currentState;

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final ResponseLogin responseLogin =
          await Provider.of<AuthProvider>(context, listen: false)
              .signin(signinForm);
      if (responseLogin != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SplashView(),
          ),
        );
      } else {
        setState(() {
          message = "Login or Password Incorrect";
        });
        Toast.show("Login or Password Incorrect", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/mairie.png'),
      ),
    );

    final phone = TextFormField(
      maxLength: 8,
      keyboardType: TextInputType.phone,
      autofocus: false,
      obscureText: true,
      onSaved: (value) {
        signinForm.phone = value.toString();
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Le numero de telephone est Obligatoire et 8 chiffres';
        }
      },
      initialValue: '',
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'numéro de telephone',
      ),
    );

    final password = TextFormField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      obscureText: true,
      cursorColor: Colors.white,
      onSaved: (value) {
        signinForm.password = value.toString();
      },
      decoration: InputDecoration(
        hintText: 'mot de passe',
        suffixIcon: IconButton(
          icon: hiddenpwd
              ? Icon(
                  Icons.visibility,
                  color: Colors.indigo[400],
                )
              : Icon(
                  Icons.visibility_off,
                  color: Colors.indigo[400],
                ),
          onPressed: () {
            setState(() {
              hiddenpwd = !hiddenpwd;
            });
          },
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: submitForm,
        padding: EdgeInsets.all(25),
        color: Colors.orange,
        child: Text('Se connecter',
            style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'mot de passe oublier ',
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ForgetPassword()));
      },
    );

    final registerLabel = FlatButton(
      child: Text(
        'Vous n avez pas de compte ? Créer un compte',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Register()));
      },
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Form(
          key: key,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              phone,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgotLabel,
              registerLabel
            ],
          ),
        ),
      ),
    );
  }
}
