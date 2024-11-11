//-------------------------------------------Form-------------------------------------------------------------------------
// EditText rounded Style
import 'package:flutter/material.dart';
import 'colors.dart';
import 'constants.dart';

Widget loading() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ]);
}

Padding editTextStyle(var hintText, TextEditingController myController,
    {isPassword = true}) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: TextFormField(
        controller: myController,
        style:
            TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
        obscureText: isPassword,
        validator: (val) {
          if (val!.length < 3) {
            return ("Lütfen giriş yapınız!");
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
          hintText: hintText,
          filled: true,
          fillColor: edit_text_background,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: edit_text_background, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: edit_text_background, width: 0.0),
          ),
        ),
      ));
}

// Login/SignUp HeadingElement
Text formHeading(var label) {
  return Text(label,
      style:
          TextStyle(color: textColorPrimary, fontSize: 30, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Text formSubHeadingForm(var label) {
  return Text(label,
      style: TextStyle(
          color: textColorSecondary, fontSize: 20, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Widget text(var text,
    {var fontSize = textSizeLargeMedium,
    textColor = textColorSecondary,
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
}

Material shadowButton(var name, VoidCallback callbackFunction) {
  return Material(
    elevation: 2,
    shadowColor: Colors.deepOrangeAccent[200],
    borderRadius: new BorderRadius.circular(40.0),
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
          child: text(name,
              fontSize: textSizeLargeMedium,
              textColor: white,
              fontFamily: fontMedium),
          textColor: white,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          color: colorPrimary,
          onPressed: callbackFunction),
    ),
  );
}
