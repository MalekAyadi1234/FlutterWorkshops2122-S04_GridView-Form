import 'package:flutter/material.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  //var
  late String? username;

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
        title: const Text("Forgot Password"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("Reinitialiser le mot de passe"),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      String message = 'Username = $username ';
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
