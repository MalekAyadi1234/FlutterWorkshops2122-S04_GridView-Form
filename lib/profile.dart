import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //var

  late String? password;
  late String? newpassword;
  late String? address;

  //key
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  //Life cycle
  @override
  void initState() {
    super.initState();
  }

  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Mot de passe est invalid';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mot de passe"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                onSaved: (value) {
                  newpassword = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'New password est invalid';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "New Password"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                onSaved: (value) {
                  address = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Adresse de facturation est invalide';
                  }
                },
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adresse de facturation"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("Enregistrer"),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      String message =
                          '\nPassword = $password \nNewPassword = $newpassword \nAddress = $address';
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Information'),
                            content: Text(message),
                            actions: [
                              TextButton(
                                  onPressed: () {}, child: Text('Got it'))
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
