import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/providers/card_information_provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:u_credit_card/u_credit_card.dart';

class FormCardPaymentScreen extends StatefulWidget {
  final String? id;
  const FormCardPaymentScreen({super.key, this.id});

  @override
  State<FormCardPaymentScreen> createState() => _FormCardPaymentScreenState();
}

class _FormCardPaymentScreenState extends State<FormCardPaymentScreen> {
  final tfCardNumber = TextEditingController();
  final tfExpired = TextEditingController();
  final tfCardHolder = TextEditingController();
  final tfCvv = TextEditingController();
  final _formKey = GlobalKey<FormState>();
 
  @override
  void initState() {
    super.initState();
    // logic find card
  }

  void findCard() {
    if (widget.id != null) {
      // lógica para buscar tarjeta
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
    final cardInformationProvider = context.read<CardInformationProvider>();
    return MainLayout(
      appBarTitle: widget.id != null ? "Editar tarjeta" : "Crear tarjeta",
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Consumer<CardInformationProvider>(
                builder: (context, ref, child) {
                  return CreditCardUi(
                    cardHolderFullName: ref.cardHolderFullName,
                    cardNumber: ref.cardTextNumber,
                    validThru: ref.cardTextExp,
                    topLeftColor: Colors.blue,
                    doesSupportNfc: true,
                    placeNfcIconAtTheEnd: true,
                    cardType: CardType.debit,
                    enableFlipping: true, // 👈 Enables the flipping
                    cvvNumber: ref.cardTextCvv, // 👈 CVV number to be shown on the back of the card
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFieldWidget(
                label: "Número de tarjeta",
                hintText: "xxxx-xxxx-xxxx-1234",
                textInputType: TextInputType.number,
                controller: tfCardNumber,
                focusNode: FocusScopeNode(),
                onValidator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
                onChanged: (value) {
                  cardInformationProvider.setCardTextNumber(value);
                },
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: "####-####-####-####",
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                label: "Nombre de titular",
                controller: tfCardHolder,
                hintText: "titular",
                onValidator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
                onChanged: (value) {
                  cardInformationProvider.setCardHolderFullName(value);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWidget(
                      label: "Fecha de expiración",
                      controller: tfExpired,
                      hintText: "MM/YY",
                      onValidator: (value) {
                        return value!.isEmpty ? "Campo requerido" : null;
                      },
                      onChanged: (value) {
                        cardInformationProvider.setCardTextExp(value);
                      },
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: "##/##",
                        ),
                      ],
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: CustomTextFieldWidget(
                      label: "CVV",
                      controller: tfCvv,
                      hintText: "***",
                      textInputType: TextInputType.number,
                      onValidator: (value) {
                        return value!.isEmpty ? "Campo requerido" : null;
                      },
                      onChanged: (value) {
                        cardInformationProvider.setCardTextCvv(value);
                      },
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: "###",
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonWidget(
                backgroundColor: secondaryColor,
                text: "Guardar",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    handleForm();
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
