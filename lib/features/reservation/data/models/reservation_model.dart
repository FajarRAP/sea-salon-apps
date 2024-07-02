import 'package:sea_submission/features/reservation/domain/entities/reservation_entity.dart';

class ReservationModel extends ReservationEntity {
  ReservationModel({
    required super.name,
    required super.phone,
    required super.serviceType,
    required super.time,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      ReservationModel(
          name: json['name'],
          phone: json['phone'],
          serviceType: json['service_type'],
          time: json['time']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'service_type': serviceType,
        'time': time,
      };
}
