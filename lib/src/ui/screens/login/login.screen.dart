import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    "Ingresa con tu cuenta",
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
                      Icons.email,
                    ),
                    label: "Correo electrónico",
                    hintText: "example@gmail.com",
                    controller: tfEmailController,
                    onValidator: (value) {
                      if (!value!.contains("@") || !value.contains(".")) {
                        return "Correo no valido";
                      } else if (value.isEmpty) {
                        return "Campo requerido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldWidget(
                    prefixIcon: const Icon(
                      Icons.password,
                    ),
                    label: "Contraseña",
                    hintText: "**********",
                    controller: tfPasswordController,
                    isPassword: true,
                    onValidator: (value) {
                      if (value!.length < 6) {
                        return "Contraseña muy corta";
                      } else if (value.isEmpty) {
                        return "Campo requerido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Olvidaste tu contraseña?",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButtonWidget(
                    text: "Ingresar",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.replace(Routes.home);
                      }
                    },
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "¿No tienes una cuenta?",
                            style: TextStyle(
                              fontSize: 15.sp,
                            )),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push(Routes.register);
                              },
                            text: " Registrarse",
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
