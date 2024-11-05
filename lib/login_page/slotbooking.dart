import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SlotBooking extends StatefulWidget {
  @override
  _SlotBookingState createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmBooking() async {
    if (selectedDate != null && selectedTime != null) {
      final formattedDate = selectedDate!.toLocal().toString().split(' ')[0];
      final formattedTime = selectedTime!.format(context);

      CollectionReference bookings =
          FirebaseFirestore.instance.collection('bookings');

      final QuerySnapshot result = await bookings
          .where('date', isEqualTo: formattedDate)
          .where('time', isEqualTo: formattedTime)
          .get();

      if (result.docs.isEmpty) {
        try {
          await bookings.add({
            'date': formattedDate,
            'time': formattedTime,
            'user': 'user_id',
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Booking confirmed for $formattedDate at $formattedTime')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to book the slot. Please try again.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Slot already booked, please select a different slot.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both date and time.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slot Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Select Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                selectedDate == null
                    ? 'Choose a date'
                    : 'Selected Date: ${selectedDate!.toLocal()}'.split(' ')[0],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Time:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(
                selectedTime == null
                    ? 'Choose a time'
                    : 'Selected Time: ${selectedTime!.format(context)}',
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _confirmBooking,
                child: Text('Confirm Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
