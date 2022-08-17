import 'package:flutter/material.dart';

class NavButton {
  final String svgPath;
  final String text;
  final VoidCallback onClick;
  const NavButton(this.svgPath, this.text, this.onClick);
}
