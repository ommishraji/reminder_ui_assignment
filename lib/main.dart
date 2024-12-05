import 'package:flutter/material.dart';
import 'dart:math' as time;
import 'package:analog_clock/analog_clock.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReminderScreen(),
    );
  }
}

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});
  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {

  List<Reminders> reminders =[
    Reminders(
      title: "Reminder 1",
      description: "Do brush",
      dateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 07, 11, 35),
      status: false,
    ),
    Reminders(
      title: "Eat food",
      description: "Go and eat break fast",
      dateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 09, 16, 41),
      status: false,
    ),
    Reminders(
      title: "Internship",
      description: "Complete your internship work",
      dateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 31, 11),
      status: true,
    ),
    Reminders(
      title: "Lunch",
      description: "Go and eat your lunch",
      dateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 15, 25),
      status: true,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
            "Reminder"
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.purple,
              Colors.pinkAccent
            ])
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*.91,
          child: ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 10,
                    color: Colors.grey[100],
                    child: ListTile(
                      leading:  SizedBox(
                        height: 80,
                        width: 50,
                        child: AnalogClock(
                          datetime: reminders[index].dateTime, // Set a custom DateTime
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          width: 200.0,
                          isLive: false, // Set to false to use the provided DateTime
                          showNumbers: false,
                          digitalClockColor: Colors.white,
                          textScaleFactor: 1.5,
                          hourHandColor: Colors.white,
                          minuteHandColor: Colors.blue,
                          secondHandColor: Colors.red,
                          numberColor: Colors.white,
                          tickColor: Colors.red,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(reminders[index].title,
                            style: const TextStyle(
                                fontSize: 20
                            ),),
                          Text("${(reminders[index].dateTime.hour) > 12 ? (reminders[index].dateTime.hour) %12 : reminders[index].dateTime.hour}:${reminders[index].dateTime.minute} ${reminders[index].dateTime.hour > 11 ? "PM" : "AM"}",
                            style: GoogleFonts.getFont("Silkscreen").copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                        ],
                      ),
                      subtitle: Text(reminders[index].description,
                        style: const TextStyle(
                            fontSize: 14
                        ),),
                      trailing: Switch(value: reminders[index].status,
                          onChanged: (value){
                        setState(() {
                          reminders[index].status = value;
                        });
                          }
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Reminders{
  String title, description;
  DateTime dateTime;
  bool status;
  Reminders({required this.title, required this.description, required this.dateTime, required this.status});
}
