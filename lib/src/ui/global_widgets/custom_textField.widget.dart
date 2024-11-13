import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? onValidator;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final bool isEnabled;
  final int maxLines;
  final FocusNode? focusNode;
  const CustomTextFieldWidget({
    super.key,
    this.label,
    this.controller,
    this.prefixIcon,
    this.isPassword = false,
    this.onValidator,
    this.onChanged,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onTap,
    this.isEnabled = true,
    this.maxLines = 1,
    this.focusNode,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isObscureText = false;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.label != null ? Text(
          widget.label!,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ) : const SizedBox(),
       widget.label != null ? const SizedBox(
          height: 6,
        ) :const SizedBox(),
        GestureDetector(
          onTap: widget.onTap,
          child: TextFormField(
            controller: widget.controller,
            obscureText: isObscureText,
            focusNode: widget.focusNode,
            validator: widget.onValidator,
            keyboardType: widget.textInputType,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            enabled: widget.isEnabled,
            maxLines: widget.maxLines,
            
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
              ),
              suffix: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            isObscureText = !isObscureText;
                          },
                        );
                      },
                      child: isObscureText
                          ? const FaIcon(
                              FontAwesomeIcons.eyeSlash,
                            )
                          : const FaIcon(
                              FontAwesomeIcons.eye,
                            ),
                    )
                  : null,
              fillColor: Colors.grey.shade200,
              filled: true,
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
