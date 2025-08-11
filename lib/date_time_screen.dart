import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (date != _selectedDate) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> _pickTime() async{
    final time = await showTimePicker(
      context: context, 
      initialTime: _selectedTime ?? TimeOfDay.now(),
      );
      setState(() {
        _selectedTime = time;
      });
  }

  @override
  Widget build(BuildContext context) {
    final dateText = _selectedDate == null
        ? 'No date chosen'
        : DateFormat.yMMMd().format(_selectedDate!);

         final timeText = _selectedTime == null
        ? 'No time chosen'
        : _selectedTime!.format(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Date And Time'),
        backgroundColor: Colors.green.shade300,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              title: Text(dateText),
              subtitle: Text('Here Is Date .'),
              leading: IconButton(
                onPressed: _pickDate,
                icon: Icon(Icons.date_range_outlined, color: Colors.black),
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text(timeText),
              subtitle: Text('Here Is Time .'),
              leading: IconButton(
                onPressed: _pickTime,
                icon: Icon(Icons.more_time_sharp, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
