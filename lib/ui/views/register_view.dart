import 'package:admin_dashboard/controllers/register_form_controller.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_dashboard/router/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterFormController registerFormCtrl =
        Get.find<RegisterFormController>();
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 370),
          child: Form(
            key: registerFormCtrl.formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Ingrese su nombre";

                    return null; //valido
                  },
                  onChanged: (value) => registerFormCtrl.name = value,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: "Ingrese su nombre",
                    label: "Nombre",
                    icon: Icons.person,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? ''))
                      return "Email no válido";

                    return null;
                  },
                  onChanged: (value) => registerFormCtrl.email = value,
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
                  onChanged: (value) => registerFormCtrl.password = value,
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
                    registerFormCtrl.validateForm();
                  },
                  text: 'Crear cuenta',
                ),
                SizedBox(height: 20),
                LinkText(
                  text: "Ir al login",
                  onPressed: () => Get.offAndToNamed(Routes.LOGINROUTE),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
