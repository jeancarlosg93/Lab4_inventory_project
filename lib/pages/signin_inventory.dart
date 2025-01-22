import 'package:flutter/material.dart';

import '../database/auth.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _formKey = GlobalKey<FormState>();
  final authService _auth = authService();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in to inventory'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.black12,
                ),
                validator: (val) =>
                    val!.isEmpty ? 'Please enter an email' : null,
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.black12,
                ),
                obscureText: true,
                validator: (val) => val!.length < 6
                    ? 'Password must be longer than 6 characters'
                    : null,
                onChanged: (val) {
                  password = val;
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            print('Sign in error.');
                          } else {
                            print('You are logged in as ${result.us}');
                          }
                        }
                      },
                      child: const Text('Sign In')),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Register'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}