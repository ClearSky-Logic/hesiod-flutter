import 'package:flutter/material.dart';

class DeviceType {
  bool isPhone(BoxConstraints constraints) => constraints.maxWidth <= 600;

  double getClampedWidth(BoxConstraints constraints) =>
      constraints.maxWidth.clamp(600, 800);
}
