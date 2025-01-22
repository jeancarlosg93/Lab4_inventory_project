import 'package:flutter/material.dart';
import 'package:inventory_project/database/auth.dart';

class RegisterIn extends StatefulWidget {
  const RegisterIn({super.key});

  @override
  State<RegisterIn> createState() => _RegisterInState();
}

class _RegisterInState extends State<RegisterIn> {
  final authService _auth = authService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register to inventory'),
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
                              .registerWithEmailAndPassword(email, password);
                          if (result == null){
                            print('Registration error.');
                          }
                          else{

                          }
                        }
                      },
                      child: const Text('Register')),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/singininventory');
                      },
                      child: const Text('Sign In'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}