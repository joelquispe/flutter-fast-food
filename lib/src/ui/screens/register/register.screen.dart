import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final tfNamesController = TextEditingController();
  final tfLastNameController = TextEditingController();
  final tfPhoneController = TextEditingController();
  final tfEmailController = TextEditingController();
  final tfPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Regístrate con una cuenta",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFieldWidget(
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    label: "Nombres",
                    controller: tfNamesController,
                    hintText: "Jose",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldWidget(
                    prefixIcon: const Icon(
                      Icons.person_2,
                    ),
                    label: "Apellidos",
                    controller: tfLastNameController,
                    hintText: "Perez",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldWidget(
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    label: "Celular",
                    controller: tfPhoneController,
                    hintText: "902123321",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldWidget(
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    label: "Correo electrónico",
                    controller: tfEmailController,
                    hintText: "example@gmail.com",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldWidget(
                    prefixIcon: const Icon(
                      Icons.password,
                    ),
                    label: "Contraseña",
                    controller: tfPasswordController,
                    isPassword: true,
                    hintText: "********",
                  ),
                 
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButtonWidget(
                    text: "Registrarse",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.push(Routes.login);
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "¿Ya tienes una cuenta?",
                            style: TextStyle(
                              fontSize: 15.sp,
                            )),
                        TextSpan(
                            text: " Iniciar sesión",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push(Routes.login);
                              },
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            )),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
