import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date and time

class DateTimeProvider with ChangeNotifier {
  String? _selectedDateTime;

  String? get selectedDateTime => _selectedDateTime;

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine date and time
        final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Format the combined date and time
        _selectedDateTime =
            DateFormat('yyyy-MM-dd hh:mm a').format(fullDateTime);
        notifyListeners(); // Notify listeners to rebuild the UI
      }
    }
  }

  // Reset the date and time
  void resetDateTime() {
    _selectedDateTime = null;
    notifyListeners();
  }
}
