import 'dart:io';
import 'package:flutter/material.dart';

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getResponsive(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return (size.height + size.width) / 2 * 0.001;
}

double getResponsiveText(BuildContext context) {
  try {
    if (Platform.isAndroid) {
      return 0.8;
    } else {
      return 0.9;
    }
  } catch (e) {
    // Fallback for web or unsupported platforms
    return 0.85;
  }
}

double figmaHeightToFlutter(double figmaPx) {
  return (figmaPx / 1600) *
      100; // Base height is now 1600px}double figmaWidthToFlutter(double figmaPx) {  return (figmaPx / 2560) * 100; // Base width is now 2560px}double figmaToFlutterTextSize(double figmaSize, BuildContext context) {  double scaleFactor = MediaQuery.of(context).textScaleFactor;  return figmaSize / scaleFactor;
}


double pixelRatio(context){
  return MediaQuery.of(context).devicePixelRatio;
}