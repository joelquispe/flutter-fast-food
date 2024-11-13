import 'package:ecommercesmall/src/router/router.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final tfNamesController = TextEditingController();
  final tfLastNameController = TextEditingController();
  final tfPhoneController = TextEditingController();
  final tfEmailController = TextEditingController();
  final tfDateOfBirthController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void updateData(){
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Datos personales",
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFieldWidget(
                label: "Nombres",
                hintText: "Marcos",
                controller: tfNamesController,
                onValidator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Apellidos",
                hintText: "Suarez",
                controller: tfLastNameController,
                onValidator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Correo electronico",
                hintText: "example@gmail.com",
                textInputType: TextInputType.emailAddress,
                controller: tfEmailController,
                onValidator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Teléfono",
                hintText: "000000000",
                textInputType: TextInputType.phone,
                controller: tfPhoneController,
                onValidator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Fecha de nacimiento",
                hintText: "22/11/1992",
                isEnabled: false,
                controller: tfDateOfBirthController,
                onValidator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
                onTap: () async {
                  DateTime? result = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    locale: const Locale('es', 'ES'),
                  );
                  if (result != null) {
                    tfDateOfBirthController.text = result.toLocal().toString().split(' ')[0];
                    setState(() {});
                  }
                  // print(result);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonWidget(
                text: "Guardar",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    updateData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
