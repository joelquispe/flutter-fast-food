import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/addresses/pick_address.screen.dart';
import 'package:flutter/material.dart';

class FormAddressesScreen extends StatefulWidget {
  const FormAddressesScreen({super.key});

  @override
  State<FormAddressesScreen> createState() => _FormAddressesScreenState();
}

class _FormAddressesScreenState extends State<FormAddressesScreen> {
  final tfAddress = TextEditingController();
  final tfNroFlat = TextEditingController();
  final tfIndications = TextEditingController();
  final tfAlias = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBarTitle: "Agregar dirección",
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFieldWidget(
                label: "Dirección",
                controller: tfAddress,
                hintText: "av. example",
                isEnabled: false,
                textInputType: TextInputType.text,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PickAddressScreen(),
                    ),
                  );

                  if (result != null) {
                    tfAddress.text = result;
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Piso",
                controller: tfNroFlat,
                hintText: "piso / departamento",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Indicaciones",
                controller: tfIndications,
                hintText: "Indicaciones para la entrega",
                textInputType: TextInputType.text,
                maxLines: 3,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Nombre para la dirección",
                controller: tfAlias,
                hintText: "Casa, departamento, trabajo, etc",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 18,
              ),
              CustomButtonWidget(
                text: "Guardar",
                backgroundColor: secondaryColor,
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}
