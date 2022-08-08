import 'package:flutter/material.dart';
import 'package:grupo_4_b/themes/theme.dart';

class DateInputField extends StatelessWidget {
  
  final IconData? suffixIcon;
  
  final Map<String, dynamic> formValues;
  final String formProperty;
  

  const DateInputField({
    Key? key,
    this.suffixIcon,
    required this.formValues,
    required this.formProperty,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return IconButton(
          icon: Icon(suffixIcon),
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context, 
              initialDate: formValues[formProperty], 
              firstDate: DateTime(2000), 
              lastDate: DateTime(2100));

            if(newDate == null) return;
            
              print(newDate);
              
              formValues[formProperty]=newDate;

              
            

          },
          
          // color: AppTheme.primary,
        );
  }
}
