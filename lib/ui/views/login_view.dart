import 'package:admin_dashboard/controllers/auth_controller.dart';
import 'package:admin_dashboard/controllers/login_form_controller.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginFormController loginFormCtrl = Get.find<LoginFormController>();
    AuthController authCtrl = Get.find<AuthController>();
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 370),
          child: Form(
            // autovalidateMode: AutovalidateMode.always,
            key: loginFormCtrl.formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? ''))
                      return "Email no válido";

                    return null;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value) => loginFormCtrl.email = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: "Ingrese su correo",
                    label: "Email",
                    icon: Icons.email_outlined,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Ingrese su contraseña";
                    if (value.length < 6)
                      return "La contraseña debe superar los 6 caracteres";

                    return null; //valido
                  },
                  onChanged: (value) => loginFormCtrl.password = value,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: "*******",
                    label: "Contraseña",
                    icon: Icons.lock_outline_rounded,
                  ),
                ),
                SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: () {
                    if (loginFormCtrl.validateForm())
                      authCtrl.login(
                        loginFormCtrl.email,
                        loginFormCtrl.password,
                      );
                  },
                  text: 'Ingresar',
                ),
                SizedBox(height: 20),
                LinkText(
                  text: "Nueva cuenta",
                  onPressed: () => Get.offAndToNamed(Routes.REGISTERROUTE),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
