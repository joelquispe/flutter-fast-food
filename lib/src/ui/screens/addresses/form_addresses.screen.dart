import 'package:ecommercesmall/src/common/utils/flutterToast.util.dart';
import 'package:ecommercesmall/src/router/router.dart';
import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/addresses/pick_address.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormAddressesScreen extends StatefulWidget {
  final String? id;
  const FormAddressesScreen({super.key, this.id});

  @override
  State<FormAddressesScreen> createState() => _FormAddressesScreenState();
}

class _FormAddressesScreenState extends State<FormAddressesScreen> {
  final tfAddress = TextEditingController();
  final tfNroFlat = TextEditingController();
  final tfIndications = TextEditingController();
  final tfAlias = TextEditingController();

  @override
  void initState() {
    super.initState();
    findAddress();
  }

  void findAddress() {
    if (widget.id != null) {
      // logica para buscar dirección
      tfAddress.text = "Mi Direccion";
      tfNroFlat.text = "Piso";
      tfIndications.text = "Indicaciones";
      tfAlias.text = "Alias";
    }
  }

  void handleForm() {
    if (widget.id != null) {
      update();
    } else {
      save();
    }
  }

  void save() {
    context.pop();
  }

  void update() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBarTitle: widget.id != null ? "Editar dirección" : "Agregar dirección",
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
                onTap: () {
                  handleForm();
                },
              ),
            ],
          ),
        ));
  }
}
