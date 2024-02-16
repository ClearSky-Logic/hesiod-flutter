import 'package:flutter/material.dart';

class DeviceType {
  bool isPhone(BoxConstraints constraints) => constraints.maxWidth <= 900;

  double getClampedWidth(BoxConstraints constraints) =>
      constraints.maxWidth.clamp(600, 800);
}
