import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isReminderEnabled = true;
  TimeOfDay selectedTime = TimeOfDay(hour: 20, minute: 0); // 8:00 PM

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 8),

              const Text(
                'Check-In Reminder',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Decorative image container
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Icon(Icons.nightlight_round, size: 80, color: Colors.white),
                  // Or use Image.asset('assets/reminder_image.png')
                ),
              ),

              const SizedBox(height: 30),

              // Enabled switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Enabled',
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: isReminderEnabled,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        isReminderEnabled = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Remind Me
              _settingsTile('Remind Me', onTap: () {
                // Add action if needed
              }),

              const SizedBox(height: 10),

              // Time
              _settingsTile('Time',
                  trailing: Text(
                    formatTime(selectedTime),
                    style: const TextStyle(fontSize: 16),
                  ),
                  onTap: _pickTime),

              const SizedBox(height: 10),

              // Track My Mood
              _settingsTile('Track My Mood', onTap: () {
                // Add action if needed
              }),

              const SizedBox(height: 10),

              // Daily Reflection
              _settingsTile('Daily Reflection', onTap: () {
                // Add action if needed
              }),

              const Spacer(),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsTile(String title, {Widget? trailing, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            trailing ??
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.black54,
                ),
          ],
        ),
      ),
    );
  }
}