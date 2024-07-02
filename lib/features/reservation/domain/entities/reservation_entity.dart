import 'package:flutter/material.dart';

class ReservationEntity {
  final String name;
  final String phone;
  final int serviceType;
  final TimeOfDay time;

  ReservationEntity({
    required this.name,
    required this.phone,
    required this.serviceType,
    required this.time,
  });
}
