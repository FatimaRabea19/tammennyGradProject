import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ================== COLORS ==================
const Color kBackground = Color(0xFFF9F3EF);
const Color kPrimary = Color(0xFF456882);
const Color kPrimaryLight = Color(0xFF6C8EBF);

/// ================== APP ==================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Health App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kBackground,

        /// ---------- AppBar ----------
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackground,
          foregroundColor: kPrimary,
          elevation: 0,
        ),

        /// ---------- FAB ----------
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kPrimary,
          foregroundColor: Colors.white,
        ),

        /// ---------- Cards ----------
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        /// ---------- Text ----------
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: kPrimary,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: kPrimary,
          ),
        ),

        /// ---------- TIME PICKER THEME ----------
        timePickerTheme: TimePickerThemeData(
          backgroundColor: kBackground,

          hourMinuteTextColor: kPrimary,
          hourMinuteColor: kPrimary.withOpacity(0.15),

          dialHandColor: kPrimary,
          dialBackgroundColor: kBackground,

          dayPeriodTextColor: kPrimary,
          dayPeriodColor: kPrimary.withOpacity(0.15),

          entryModeIconColor: kPrimary,

          helpTextStyle: const TextStyle(
            color: kPrimary,
            fontWeight: FontWeight.bold,
          ),

          cancelButtonStyle: TextButton.styleFrom(
            foregroundColor: kPrimary,
          ),
          confirmButtonStyle: TextButton.styleFrom(
            foregroundColor: kPrimary,
          ),
        ),

        /// ---------- DATE PICKER THEME ----------
        datePickerTheme: DatePickerThemeData(
          backgroundColor: kBackground,
          headerBackgroundColor: kPrimary,
          headerForegroundColor: Colors.white,

          todayForegroundColor:
          MaterialStateProperty.all(kPrimary),
          todayBorder:
          BorderSide(color: kPrimary),

          dayForegroundColor:
          MaterialStateProperty.all(kPrimary),

          yearForegroundColor:
          MaterialStateProperty.all(kPrimary),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      home: const SpecialistProfileScreen(),
    );
  }
}

/// ================== MODEL ==================
class Availability {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String type; // online / offline

  Availability({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.type,
  });
}

/// ================== SCREEN ==================
class SpecialistProfileScreen extends StatefulWidget {
  const SpecialistProfileScreen({super.key});

  @override
  State<SpecialistProfileScreen> createState() =>
      _SpecialistProfileScreenState();
}

class _SpecialistProfileScreenState extends State<SpecialistProfileScreen> {
  final List<Availability> availabilities = [];

  void addAvailability(Availability availability) {
    setState(() {
      availabilities.add(availability);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specialist Profile'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddAvailabilitySheet(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -------- Specialist Info ----------
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kPrimary,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Mariam',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimary,
                      ),
                    ),
                    Text(
                      'Psychologist',
                      style: TextStyle(color: kPrimary),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Available Appointments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimary,
              ),
            ),

            const SizedBox(height: 12),

            /// -------- Availability List ----------
            Expanded(
              child: availabilities.isEmpty
                  ? const Center(
                child: Text(
                  'No appointments added yet',
                  style: TextStyle(color: kPrimary),
                ),
              )
                  : ListView.builder(
                itemCount: availabilities.length,
                itemBuilder: (context, index) {
                  final slot = availabilities[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        slot.type == 'online'
                            ? Icons.video_call
                            : Icons.location_on,
                        color: kPrimary,
                      ),
                      title: Text(
                        '${slot.startTime.format(context)} - ${slot.endTime.format(context)}',
                        style: const TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '${slot.date.toLocal().toString().split(' ')[0]} • ${slot.type}',
                        style: TextStyle(
                          color: kPrimary.withOpacity(0.7),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================== ADD AVAILABILITY ==================
  void showAddAvailabilitySheet(BuildContext context) {
    DateTime? selectedDate;
    TimeOfDay? startTime;
    TimeOfDay? endTime;
    String sessionType = 'online';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: kBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: StatefulBuilder(
            builder: (context, setSheetState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Add Availability',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimary,
                    ),
                  ),

                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    value: sessionType,
                    decoration: const InputDecoration(
                      labelText: 'Session Type',
                      labelStyle: TextStyle(color: kPrimary),
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'online',
                        child: Text('Online'),
                      ),
                      DropdownMenuItem(
                        value: 'offline',
                        child: Text('Offline'),
                      ),
                    ],
                    onChanged: (value) {
                      setSheetState(() {
                        sessionType = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        initialDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setSheetState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Text(
                      selectedDate == null
                          ? 'Select Date'
                          : selectedDate!
                          .toLocal()
                          .toString()
                          .split(' ')[0],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: kPrimary,
                        ),
                        onPressed: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null) {
                            setSheetState(() {
                              startTime = picked;
                            });
                          }
                        },
                        child: Text(
                          startTime == null
                              ? 'Start Time'
                              : startTime!.format(context),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: kPrimary,
                        ),
                        onPressed: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null) {
                            setSheetState(() {
                              endTime = picked;
                            });
                          }
                        },
                        child: Text(
                          endTime == null
                              ? 'End Time'
                              : endTime!.format(context),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (selectedDate != null &&
                          startTime != null &&
                          endTime != null) {
                        addAvailability(
                          Availability(
                            date: selectedDate!,
                            startTime: startTime!,
                            endTime: endTime!,
                            type: sessionType,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),

                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
