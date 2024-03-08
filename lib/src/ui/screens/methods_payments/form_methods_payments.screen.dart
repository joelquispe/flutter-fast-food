import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class FormMethodsPaymentsScreen extends StatefulWidget {
  const FormMethodsPaymentsScreen({super.key});

  @override
  State<FormMethodsPaymentsScreen> createState() => _FormMethodsPaymentsScreenState();
}

class _FormMethodsPaymentsScreenState extends State<FormMethodsPaymentsScreen> {
  final tfCardNumber = TextEditingController();
  final tfExpired = TextEditingController();
  final tfCardHolder = TextEditingController();
  final tfCvv = TextEditingController();

  String textCardNumber = "";

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Crear método de pago",
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: tfCardNumber.text,
              expiryDate: tfExpired.text,
              cardHolderName: tfCardHolder.text,

              cvvCode: tfCvv.text,
              showBackView: false, //true when you want to show cvv(back) view
              cardType: CardType.visa,
              enableFloatingCard: true,
              cardBgColor: secondaryColor,
              isHolderNameVisible: true,
              isSwipeGestureEnabled: true,
              animationDuration: Duration(milliseconds: 200),
              onCreditCardWidgetChange: (CreditCardBrand brand) {
                print(brand);
              },
            ),
            CustomTextFieldWidget(
              label: "Número de tarjeta",
              hintText: "xxxx-xxxx-xxxx-1234",
              textInputType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  tfCardNumber.text = value;
                });

                print(tfCardNumber.text);
              },
              inputFormatters: [
                // MaskTextInputFormatter(
                //   mask: "####-####-####-####",
                // )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextFieldWidget(
              label: "Nombre de titular",
              controller: tfCardHolder,
              hintText: "titular",
              onChanged: (value) {
                setState(() {
                  tfCardHolder.text = value;
                });
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
                    onChanged: (value) {
                      setState(() {
                        tfExpired.text = value;
                      });
                    },
                    inputFormatters: [
                      // MaskTextInputFormatter(
                      //   mask: "##/##",
                      // )
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
                    onChanged: (value) {
                      setState(() {
                        tfCvv.text = value;
                      });
                    },
                    inputFormatters: [
                      // MaskTextInputFormatter(
                      //   mask: "###",
                      // )
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
