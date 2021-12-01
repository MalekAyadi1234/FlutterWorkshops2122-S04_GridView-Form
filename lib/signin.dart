import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //var
  late String? username;
  late String? password;

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
        title: const Text("Sign In"),
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
                onSaved: (value) {
                  username = value;
                },
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Username ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
              ),
            ),
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
              width: 500,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    String message =
                        'Username = $username \nPassword = $password ';
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Information'),
                          content: Text(message),
                          actions: [
                            TextButton(onPressed: () {}, child: Text('Got it'))
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text("S'authentifier"),
              ),
            ),
            Container(
              width: 500,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                child: const Text("Mot de passe oublié ?"),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pas encore de compte ?"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "S'inscrire",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
