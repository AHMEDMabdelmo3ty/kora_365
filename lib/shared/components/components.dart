// ignore_for_file: non_constant_identifier_names

import 'package:kora/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      margin: const EdgeInsets.all(18.0),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: background),
    );
Widget defaultButtonLang({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function() function,
  required String text,
}) =>
    InkWell(
      child: Container(
        width: width,
        height: 50.0,
        margin: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.translate,
              color: Colors.white,
            ),
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: background),
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(color: Colors.blue),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? lines,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      maxLines: lines,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
    );

Widget ReadTextFormField({
  required TextEditingController controller,
  required String label,
  required Widget? widget,
  required double mq,
}) {
  return Container(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            label,
            style: GoogleFonts.balsamiqSans(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        if (widget != null)
          Padding(
            padding: const EdgeInsets.all(15),
            child: widget,
          )
      ],
    ),
    width: mq,
    height: 70,
    decoration: BoxDecoration(
        color: colorFormField,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: defaultColor)),
  );
}

void NavigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 3.0,
        color: Colors.grey[300],
      ),
    );

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, EROOR, WARNING }
Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.EROOR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = const Color.fromARGB(255, 214, 147, 3);
      break;
  }
  return color;
}

Color colorFormField = HexColor('#F6F8FF');
Color colorField = HexColor('#4182FF');
