import 'package:flutter/material.dart';

class Colors {

  const Colors();


  static const Color appBarTitle = const Color(0xFF00BFA5);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  static const Color appBarText = const Color(0xFFFFFFFF);
  static const Color themeColor = const Color(0xFFFFFFFF);
  //static const Color productCard = const Color(0xFF434273);
  static const Color productCard = const Color(0XFFECEFF1);
  //static const Color productListBackground = const Color(0xFF3E3963);
  static const Color productPageBackground = const Color(0xFFB2DFDB);
  static const Color productTitle = const Color(0xDD000000);
  static const Color productCategory = const Color(0xDD000000);
  static const Color productBestPrice = const Color(0xDD000000);
  static const Color productRating = const Color(0xDD000000);
  

}

class Dimens {
  const Dimens();

  static const productWidth = 100.0;
  static const productHeight = 100.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
    color: Colors.appBarText,
    fontFamily: 'Poppins',
    //fontWeight: FontWeight.w600,
     fontSize: 24.0
  );

  static const TextStyle productTitle = const TextStyle(
    color: Colors.productTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 24.0
  );

  static const TextStyle productCategory = const TextStyle(
    color: Colors.productCategory,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 14.0
  );

  static const TextStyle productBestPrice = const TextStyle(
    color: Colors.productBestPrice,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 12.0
  );


  static const TextStyle productRating = const TextStyle(
    color: Colors.productRating,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 12.0
  );
}
