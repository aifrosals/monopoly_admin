import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/validator.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:provider/provider.dart';


class AdminLogin extends StatefulWidget {
  static const String route = '/adminLogin';

  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _emailController =
      TextEditingController(text: 'admin@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '1234567');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Use these credentails to login'),
            Text('Email: admin@gmail.com'),
            Text('Password: 1234567'),
            const SizedBox(
              height: 40,
            ),
            Card(
              color: Colors.grey[200],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Please Enter your e-mail and password'),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null) {
                              return 'Email Cannot be empty';
                            } else if (!Validator.validateEmail(value)) {
                              return 'Enter correct email';
                            } else {
                              return null;
                            }
                          },
                          onFieldSubmitted: (value) async {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              bool res = await adminProvider.login(
                                  _emailController.text,
                                  _passwordController.text);
                              if (res) {
                                Navigator.of(context).pushNamed('/dashboard');
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              labelText: 'Password'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null) {
                              return 'Password Cannot be empty';
                            } else if (!Validator.validatePassword(value)) {
                              return 'Password should be of at least 6 characters';
                            } else {
                              return null;
                            }
                          },
                          onFieldSubmitted: (value) async {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              bool res = await adminProvider.login(
                                  _emailController.text,
                                  _passwordController.text);
                              if (res) {
                                Navigator.of(context).pushNamed('/dashboard');
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<AdminProvider>(
                          builder: (context, adminProvider, child) {
                        if (adminProvider.loginLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  bool res = await adminProvider.login(
                                      _emailController.text,
                                      _passwordController.text);
                                  if (res) {
                                    Navigator.pushNamed(context, '/dashboard');
                                  }
                                }
                              },
                              child: const Text('Login'));
                        }
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
