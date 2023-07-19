import 'package:flutter/material.dart';

// Hight size

sHeightDynamic(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.height * value;
}

sHeightFull(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top;
}

sHeightMinus(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.height -
      value -
      MediaQuery.of(context).viewPadding.top;
}

sHeightBackButton(BuildContext context) {
  return 60.0;
}

// Width size

sWidthDynamic(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.width * value;
}

sWidthFull(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

sWidthMinus(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.width - value;
}
