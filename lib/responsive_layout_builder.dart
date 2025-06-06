// responsive_layout_builder.dart
import 'package:flutter/material.dart';

enum DeviceScreenType { mobile, tablet, desktop }

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double width = mediaQuery.size.width;
  if (width >= 1024) {
    return DeviceScreenType.desktop;
  } else if (width >= 600) {
    return DeviceScreenType.tablet;
  } else {
    return DeviceScreenType.mobile;
  }
}

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceScreenType deviceType) builder;

  const ResponsiveLayoutBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceType = getDeviceType(mediaQuery);

    return builder(context, deviceType);
  }
}
