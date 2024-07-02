import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_submission/core/common/snackbar.dart';
import 'package:sea_submission/features/reservation/domain/entities/reservation_entity.dart';
import 'package:sea_submission/features/reservation/presentation/cubit/reservation_cubit.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final serviceController = TextEditingController();
  TimeOfDay? time;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reservationCubit = context.read<ReservationCubit>();

    return BlocListener<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is ReservationError) {
          errorSnackbar(state.message, context);
        }
        if (state is ReservationLoaded) {
          successSnackbar(state.message, context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reservation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Active Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: LayoutBuilder(
                  builder: (context, constraints) => DropdownMenu(
                    controller: serviceController,
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(
                          value: 1, label: 'Haircuts and styling'),
                      DropdownMenuEntry(
                          value: 2, label: 'Manicure and pedicure'),
                      DropdownMenuEntry(value: 3, label: 'Facial treatments'),
                    ],
                    width: constraints.maxWidth,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () async {
                    time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() => time);
                    }
                  },
                  child: Text(
                      time == null ? 'Select Time' : time!.format(context)),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (time != null) {
                      reservationCubit.makeReservation(
                        ReservationEntity(
                            name: nameController.text.trim(),
                            phone: phoneController.text.trim(),
                            serviceType:
                                int.tryParse(serviceController.text.trim()) ??
                                    -1,
                            time: time!),
                      );
                    } else {
                      errorSnackbar('Isi Timenya', context);
                    }
                  },
                  child: BlocBuilder<ReservationCubit, ReservationState>(
                    builder: (context, state) {
                      if (state is ReservationLoading) {
                        return const CircularProgressIndicator();
                      }
                      return const Text('Reserve');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
