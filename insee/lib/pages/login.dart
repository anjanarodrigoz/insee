import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insee/widgets/custom_text_form_field.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final _loginController = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(top: 60.0, right: 60.0, left: 60.0),
              color: Colors.red,
              child: Column(
                children: [
                  const Text(
                    'Welcome To Cost Model Design Simulator',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      child: SizedBox(
                        width: 500.0,
                        height: 400.0,
                        child: Form(
                          key: _loginController.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: _loginController.validateEmail,
                                onSaved: (value) {
                                  _loginController.email = value!;
                                },
                                labelText: 'Email',
                              ),
                              const SizedBox(height: 20.0),
                              CustomTextFormField(
                                obscureText: true,
                                validator: _loginController.validatePassword,
                                onSaved: (value) {
                                  _loginController.password = value!;
                                },
                                labelText: 'Password',
                              ),
                              const SizedBox(height: 32.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    fixedSize: const Size(200.0, 40.0)),
                                onPressed: _loginController.submit,
                                child: const Text('LOGIN'),
                              ),
                              const SizedBox(
                                height: 100.0,
                              ),
                              const Text(
                                '@Developed by Shark Developers',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('insee.png'),
                const Text(
                  textAlign: TextAlign.center,
                  'SIAM CITY CIMENT LANKA LIMITED ARUWAKKARU QUARRY SITE',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
