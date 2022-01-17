import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {
  const AppResponsive(
      {Key? key, required this.mobile, this.tablet, required this.desktop})
      : super(key: key);
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  /// This size work for my design, maybe you need some changes depend on your design
  /// make function that can help us later
  /// make funcation and use later
  static bool isMobile(context) => MediaQuery.of(context).size.width < 900;
  //
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 900;
  //
  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1100;
  //
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
