import 'package:flutter/material.dart';
import 'package:grupo_4_b/themes/theme.dart';

class CustomInputField extends StatelessWidget {
  final bool? autofocus;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final IconData? icon;
  final IconData? suffixIcon;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Map<String, dynamic> formValues;
  final String formProperty;
  final String? initialValue;
  final String? tipoRespuesta;

  const CustomInputField({
    Key? key,
    this.autofocus,
    this.keyboardType,
    this.obscureText,
    this.icon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.helperText,
    required this.formValues,
    required this.formProperty,
    this.initialValue,
    this.tipoRespuesta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      initialValue: initialValue,
      textCapitalization: TextCapitalization.words,
      onChanged: (value)  {
        if (tipoRespuesta == 'int'){
           formValues[formProperty] = int.parse(value);
           print(value);
        }
        if (tipoRespuesta == 'double'){
           formValues[formProperty] = double.parse(value);
        }
        if (tipoRespuesta == 'datetime'){
           formValues[formProperty] = DateTime.parse(value);
           print(formValues[formProperty]);
        }
        if(tipoRespuesta ==null){
           formValues[formProperty] = value;
        }
       },
      validator: (value) {
        if (value == null) {
          return 'Obligatorio';
        }

        return null;
        // if (value.length < 3) return 'No puede tener menos de 2 caracteres';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: Icon(
          suffixIcon,
          color: AppTheme.primary,
        ),
        // prefixIcon: Icon(Icons.supervised_user_circle_rounded),
        icon: Icon(
          icon,
          color: AppTheme.primary,
        ),
      ),
    );
  }
}
