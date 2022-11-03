import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/validator.dart';
import 'package:monopoly_admin/providers/reset_password_provider.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  static const String route = '/reset_password';
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController =
  TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ResetPasswordProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Monopoly'),
          leading: const SizedBox(),
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Reset Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
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
                            const Text('Please Enter your new password'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    labelText: 'New Password'),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Password Cannot be empty';
                                  } else if (!Validator.validatePassword(value)) {
                                    return 'Password must be longer than 6 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                onFieldSubmitted: (value) async {
                                  if (_formKey.currentState != null &&
                                      _formKey.currentState!.validate()) {

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
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    labelText: 'Confirm Password'),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value != _passwordController.text) {
                                    return 'Password does not match';
                                  } else {
                                    return null;
                                  }
                                },
                                onFieldSubmitted: (value) async {
                                  if (_formKey.currentState != null &&
                                      _formKey.currentState!.validate()) {

                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Consumer<ResetPasswordProvider>(
                                builder: (context, resetProvider, child) {
                                  if (resetProvider.loading) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    return ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState != null &&
                                              _formKey.currentState!.validate()) {

                                          }
                                        },
                                        child: const Text('Reset'));
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
      ),
    );
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
