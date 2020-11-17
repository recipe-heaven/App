import 'package:flutter/material.dart';

final primaryTextColor = Color(0xFFFFFFFF);
final formTextColor = Color(0xFF555555);
final formSecondaryHintColor = Color(0xFFCCCCCC);
final formPrimaryHintColor = Color(0xFF2B3B40);
final errorColor = Color(0xFFD96060);
final acceptColor = Color(0xFF4F6E81);
final disabledAcceptColor = Color(0xFF637283);
final softTextColor = Color(0xFFD5E2E6);
final fadeTextColor = Color(0xFF687A89);
final mainBackgroundColor = Color(0xFF161D21);
final elementBackgroundColor = Color(0xFF222D33);
final elementSecondaryBackgroundColor = Color(0xFFFFFFFF);
final linkActiveColor = Color(0xFFFFC891);
final splitLineColor = Color(0xFF304048);
final recipeStepDescriptionBackground = Color(0xFF1D262B);

final buttonEnabledColor = Color(0xFF4F6E81);
final buttonDisabledColor = Color(0xFF222D33);

final YeahhhhhColor = Color(0xFF00bb00);

final navBarBackgroundColor = Color(0xFF222D33);
final shadowColor = Color(0xCC111D22);

final dialogBackgroundColor = Color(0x1C000000);

final playfairFont = "Playfair_Display";
final robotoFont = "Roboto";
final lobsterFont = "Lobster";

final logoTextStyle =
    TextStyle(fontFamily: "Lobster", color: primaryTextColor, fontSize: 50);

final courseNavbarTextStyle = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w200,
    color: Colors.white,
    fontSize: 10);

final courseNavbarTextStyleActive = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w200,
    color: linkActiveColor,
    fontSize: 10);

final shadowBoxDecoration = BoxDecoration(boxShadow: [
  BoxShadow(
      color: shadowColor, //Colors.yellow,
      blurRadius: 2,
      offset: const Offset(0.5, 2),
      spreadRadius: 4)
]);

final _sharedInputFeatures = InputDecorationTheme(
  filled: true,
  isDense: true,
  contentPadding: const EdgeInsets.all(10),
);

final secondaryInputDecorationTheme = _sharedInputFeatures.copyWith(
    fillColor: elementSecondaryBackgroundColor,
    border: new OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0), // dobbel defined also in input_fealds
      ),
    ),
    hintStyle: TextStyle(
        fontFamily: robotoFont,
        color: formSecondaryHintColor,
        fontStyle: FontStyle.italic,
        fontSize: 12));

final primaryInputDecorationTheme = _sharedInputFeatures.copyWith(
    fillColor: elementBackgroundColor,
    border: new OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0), // dobbel defined also in input_fealds
      ),
    ),
    hintStyle: TextStyle(
        fontFamily: robotoFont,
        color: formPrimaryHintColor,
        fontStyle: FontStyle.italic,
        fontSize: 12));

Widget inputFealdShadowWrapper({Widget child}) {
  return Material(
    color: Colors.transparent,
    child: child,
    elevation: 5,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}

final mainTheme = ThemeData(
    buttonColor: acceptColor,
    errorColor: errorColor,

    // The background color for major parts of the app (toolbars, tab bars, etc) [...]
    primaryColor: elementBackgroundColor,
    //
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: navBarBackgroundColor,
        selectedIconTheme: IconThemeData(
          color: linkActiveColor,
        ),
        selectedLabelStyle: TextStyle(color: linkActiveColor, fontSize: 10),
        selectedItemColor: linkActiveColor,
        unselectedIconTheme: IconThemeData(
          color: softTextColor,
        ),
        unselectedLabelStyle: TextStyle(color: softTextColor, fontSize: 10)),
    shadowColor: shadowColor,
    dialogBackgroundColor: elementBackgroundColor,
    inputDecorationTheme: primaryInputDecorationTheme,
    backgroundColor: mainBackgroundColor,
    scaffoldBackgroundColor: mainBackgroundColor,
    iconTheme: IconThemeData(color: fadeTextColor),
    dividerColor: splitLineColor,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: acceptColor),

    //bottomAppBarColor: Colors.deepOrange,
    accentColor: Colors.red,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        // Used for emphasizing text that would otherwise be bodyText2.
        bodyText1: TextStyle(
            fontFamily: robotoFont,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: primaryTextColor),
        // The default text style for Material.
        bodyText2: TextStyle(
            fontFamily: robotoFont,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: primaryTextColor),

        // Used for text on ElevatedButton, TextButton and OutlinedButton.
        //button: null,
        // Used for auxiliary text associated with images.
        //caption: null,
        // The smallest style. [...]
        //overline: null,
        // Used for the primary text in lists (e.g., ListTile.title).
        // subtitle1: ,
        // For medium emphasis text that's a little smaller than subtitle1.
        //subtitle2: null,
        // Extremely large text.
        headline1: TextStyle(
            fontFamily: playfairFont,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontSize: 32),
        // Very, very large text. [...]
        headline2: TextStyle(
            fontFamily: playfairFont,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontSize: 24),
        // Very large text.
        headline3: TextStyle(fontFamily: robotoFont, color: softTextColor),
        // Large text.
        headline4: TextStyle(
            fontFamily: robotoFont,
            color: splitLineColor,
            fontStyle: FontStyle.italic,
            fontSize: 12),
        // Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
        headline5: null,
        // Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
        headline6: TextStyle(fontFamily: robotoFont, color: softTextColor)),
    accentTextTheme: TextTheme(
        // Used for emphasizing text that would otherwise be bodyText2.
        bodyText1: TextStyle(
            fontFamily: robotoFont,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: softTextColor),
        // The default text style for Material.
        bodyText2: TextStyle(
            fontFamily: robotoFont,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: softTextColor),
        // Used for text on ElevatedButton, TextButton and OutlinedButton.
        //button: null,
        // Used for auxiliary text associated with images.
        //caption: null,
        // The smallest style. [...]
        //overline: null,
        // Used for the primary text in lists (e.g., ListTile.title).
        //subtitle1: null,
        // For medium emphasis text that's a little smaller than subtitle1.
        //subtitle2: null,
        // Extremely large text.
        headline1: TextStyle(
            fontFamily: playfairFont,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontSize: 32),
        // Very, very large text. [...]
        headline2: TextStyle(
            fontFamily: playfairFont,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontSize: 24),
        // Very large text.
        headline3: TextStyle(
            fontFamily: playfairFont,
            fontStyle: FontStyle.normal,
            color: softTextColor,
            fontSize: 16),
        // Large text.
        headline4: TextStyle(
            fontFamily: robotoFont,
            fontWeight: FontWeight.w200,
            color: primaryTextColor,
            fontStyle: FontStyle.normal,
            fontSize: 12),
        // Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
        headline5: null,
        // Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
        headline6: TextStyle(fontFamily: robotoFont, color: softTextColor)),
    // Default text theme
    primaryTextTheme: TextTheme(
        // Used for emphasizing text that would otherwise be bodyText2.
        bodyText1: TextStyle(
            fontFamily: robotoFont,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: primaryTextColor),
        // The default text style for Material.
        bodyText2: TextStyle(
            fontFamily: robotoFont,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: primaryTextColor),
        // Used for text on ElevatedButton, TextButton and OutlinedButton.
        //button: null,
        // Used for auxiliary text associated with images.
        //caption: null,
        // The smallest style. [...]
        //overline: null,
        // Used for the primary text in lists (e.g., ListTile.title).
        //subtitle1: null,
        // For medium emphasis text that's a little smaller than subtitle1.
        //subtitle2: null,
        // Extremely large text.
        headline1: TextStyle(
            fontFamily: playfairFont,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontSize: 32),
        // Very, very large text. [...]
        headline2: TextStyle(
            fontFamily: playfairFont,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontSize: 24),
        // Very large text.
        headline3: TextStyle(fontFamily: robotoFont, color: softTextColor),
        // Large text.
        headline4: TextStyle(
            fontFamily: robotoFont,
            color: splitLineColor,
            fontStyle: FontStyle.italic,
            fontSize: 12),
        // Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
        headline5: null,
        // Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
        headline6: TextStyle(fontFamily: robotoFont, color: softTextColor)));
/*

Theme.of(context).textTheme.headline4


 */
