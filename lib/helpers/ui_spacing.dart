import 'package:flutter/material.dart';

/// Horizontal sized box Spacing
const Widget SW2 = SizedBox(width: 2.0);
const Widget SW5 = SizedBox(width: 5.0);
const Widget SW8 = SizedBox(width: 8.0);
const Widget SW10 = SizedBox(width: 10.0);
const Widget SW12 = SizedBox(width: 12.0);
const Widget SW14 = SizedBox(width: 14.0);
const Widget SW16 = SizedBox(width: 16.0);
const Widget SW24 = SizedBox(width: 24.0);
const Widget SW30 = SizedBox(width: 30.0);
const Widget SW32 = SizedBox(width: 32.0);

/// Vertical sized box Spacing
const Widget SH5 = SizedBox(height: 5.0);
const Widget SH8 = SizedBox(height: 8.0);
const Widget SH10 = SizedBox(height: 10.0);
const Widget SH12 = SizedBox(height: 12.0);
const Widget SH16 = SizedBox(height: 16.0);
const Widget SH20 = SizedBox(height: 20.0);
const Widget SH24 = SizedBox(height: 24.0);
const Widget SH30 = SizedBox(height: 30.0);
const Widget SH32 = SizedBox(height: 32.0);
const Widget SH40 = SizedBox(height: 40.0);
const Widget SH50 = SizedBox(height: 50.0);
const Widget SH60 = SizedBox(height: 60.0);
const Widget SH70 = SizedBox(height: 70.0);
const Widget SH80 = SizedBox(height: 80.0);
const Widget SH100 = SizedBox(height: 100.0);

/// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;