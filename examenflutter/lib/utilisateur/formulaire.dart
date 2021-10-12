import 'package:examenflutter/models/acte_naissance.dart';
import 'package:examenflutter/models/user.dart';
import 'package:examenflutter/providers/acte_naiss.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class FormDemande extends StatefulWidget {
  static String rootName = "/form_demande";
  final User user;
  const FormDemande({Key key, this.user}) : super(key: key);

  @override
  _FormDemandeState createState() => _FormDemandeState();
}

class _FormDemandeState extends State<FormDemande> {

  final format = new DateFormat("yyyy-MM-dd HH:mm");
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  
  final TextEditingController _adresseController =
      new TextEditingController(text: "");

  final TextEditingController nomController = new TextEditingController();
  TextEditingController prenomController = TextEditingController(text: "");
  TextEditingController dateController = new TextEditingController();
  TextEditingController nomPereController = new TextEditingController();
  TextEditingController prenomPereController = new TextEditingController();
  TextEditingController nomMereController = new TextEditingController();
  TextEditingController prenomMereController = new TextEditingController();
  TextEditingController professionPereController = new TextEditingController();
  TextEditingController professionMereController = new TextEditingController();

  FormState get form => key.currentState;
  String message = "";
  ActeNaiss acteNaiss;
  @override
  void initState() {
    acteNaiss = ActeNaiss(
      commune: null,
      user_id: widget.user.id,
      firstName: null,
      lastName: null,
      firstNameFather: null,
      lastNameFather: null,
      firstNameMother: null,
      lastNameMother: null,
      fatherJob: null,
      motherJob: null,
      dateBorn: null,
      address: null,
    );

    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      ActeNaiss acteNaiss = ActeNaiss();
      acteNaiss.firstName = nomController.text;
      acteNaiss.user_id = widget.user.id;
      acteNaiss.lastName = prenomController.text;
      acteNaiss.firstNameFather = nomPereController.text;
      acteNaiss.lastNameFather = nomPereController.text;

      acteNaiss.firstNameMother = nomMereController.text;
      acteNaiss.lastNameMother = nomMereController.text;
      acteNaiss.address = _adresseController.text;
      acteNaiss.motherJob = professionMereController.text;
      acteNaiss.fatherJob = professionPereController.text;
      acteNaiss.dateBorn = dateController.text;
      acteNaiss.commune = dropdownValue;

      final ActeNaiss responseActe =
          await Provider.of<ActeApiProvider>(context, listen: false)
              .addDataActe(acteNaiss);

      if (responseActe != null) {
        form.reset();

        Toast.show("Acte ajouté avec succes", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.green);
      } else {
        setState(() {
          message = "Erreur produite lors de l'enregistrement";
        });
      }
    }
  }

  String dropdownValue = 'Commune I';
  @override
  Widget build(BuildContext context) {
    final title = Text("Veuillez Remplir les champs");
    return Scaffold(
        appBar: AppBar(
          title: Text("Formulaire de Demande"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: new DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 30,
                              elevation: 16,
                              style: const TextStyle(color: Colors.white),
                              underline: Container(
                                height: 2,
                                color: Colors.blue,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Commune I',
                                'Commune II',
                                'Commune III',
                                'Commune IV',
                                'Commune V',
                                'Commune VI'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              child: TextFormField(
                            controller: nomController,
                            autofocus: false,
                            cursorColor: Colors.white,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "nom is required";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Nom',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          )),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              child: new TextFormField(
                            controller: prenomController,
                            autofocus: false,
                            cursorColor: Colors.white,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "prenom is required";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Prenom',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          )),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              child: new DateTimeField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.date_range,
                                  size: 25.0, color: Colors.blue),
                              hintText: 'Entrer la date/Heure de la naissance',
                              labelStyle:
                                  TextStyle(fontSize: 18.0, color: Colors.blue),
                              labelText: 'Date/Heure de naissance',
                              hintStyle: TextStyle(fontSize: 12.0),
                            ),
                            format: format,
                            onShowPicker: (context, currentValue) async {
                              final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                              if (date != null) {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.combine(date, time);
                              } else {
                                return currentValue;
                              }
                            },
                            validator: (v) {
                              if ((v.toString().isEmpty) ||
                                  (DateTime.tryParse(v.toString()) == null)) {
                                return 'Please enter a valid borth date';
                              }
                              return null;
                            },
                          )),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              child: new TextFormField(
                            controller: nomPereController,
                            autofocus: false,
                            cursorColor: Colors.white,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "nom du pere is required";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Nom du Pere',
                              labelText: 'Nom du Pere',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          )),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            child: new TextFormField(
                              controller: prenomPereController,
                              autofocus: false,
                              cursorColor: Colors.white,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "prenom du pere is required";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Prenom du pere',
                                labelText: 'Prenom du pere',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            child: new TextFormField(
                              controller: nomMereController,
                              autofocus: false,
                              cursorColor: Colors.white,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "nom de la mere is required";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Nom de la Mere',
                                labelText: 'Nom de la Mere',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            child: new TextFormField(
                              controller: prenomMereController,
                              autofocus: false,
                              cursorColor: Colors.white,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "prenom de la mere is required";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Prenom de la Mere',
                                labelText: 'Prenom de la Mere',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              child: new TextFormField(
                            controller: professionPereController,
                            autofocus: false,
                            cursorColor: Colors.white,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "profession du pere is required";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Profession du Pere',
                              labelText: 'Profession du Pere',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          )),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              child: new TextFormField(
                            controller: professionMereController,
                            autofocus: false,
                            cursorColor: Colors.white,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "profession de la mere is required";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Profession de la  Mere',
                              labelText: 'Profession de la Mere',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          )),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              child: new TextFormField(
                            controller: _adresseController,
                            autofocus: false,
                            cursorColor: Colors.white,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "adresse is required";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Adresse',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          )),
                          SizedBox(
                            width: 150,
                            height: 100,
                            child: Row(
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context)
                                            .buttonColor, //background color of button
                                        side: BorderSide(
                                            width: 2,
                                            color: Colors
                                                .green), //border width and color
                                        elevation: 2, //elevation of button
                                        shape: RoundedRectangleBorder(
                                            //to set border radius to button
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        padding: EdgeInsets.all(
                                            10) //content padding inside button
                                        ),
                                    onPressed: submitForm,
                                    child: Text(
                                      '   Valider  ',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
