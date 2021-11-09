import 'package:flutter/material.dart';

Widget buildSpaceH(double h) {
  return SizedBox(
    height: h,
  );
}

Widget buildSpaceW(double w) {
  return SizedBox(
    width: w,
  );
}

Widget buildDivider(double thickness) {
  return Divider(thickness: thickness);
}

Widget buildTextField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required String hint
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Container(
      //   margin: const EdgeInsets.only(bottom: 8),
      //   child:  Text(
      //       nameField
      //   ),
      // ),
      TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  validator: (s)=>validate(s),

  decoration: InputDecoration(
  labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            hintText: hint),

      ),

  ],
  );
}

