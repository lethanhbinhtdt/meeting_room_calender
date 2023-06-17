import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditCalendarScreen extends StatelessWidget {
  final mainColors = const Color.fromARGB(255, 77, 97, 252);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Meeting'),
        actions: [
          IconButton(
              onPressed: () {
                context.goNamed('home');
              },
              icon: Icon(Icons.arrow_back)),
          SizedBox(
            width: 18,
          )
        ],
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 241, 241, 241)),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Edit Meeting',
                  style: TextStyle(
                      color: Color.fromARGB(255, 85, 61, 95),
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Team',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      style: TextStyle(fontSize: 14),
                      initialValue: '3',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Time',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            const Text(
                              '2023/06/20 | 15:00 - 16:00',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  _dialogBuilder(context);
                                },
                                icon: Icon(
                                  Icons.date_range,
                                  size: 24,
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      style: TextStyle(fontSize: 14),
                      initialValue: 'meeting with FPT',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Content',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      style: TextStyle(fontSize: 14),
                      maxLines: 3,
                      initialValue: 'team 3 meeting with FPT',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Text('Submit',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: Dialog(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: DatePickerDialog(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().add(Duration(days: -90)),
                    lastDate: DateTime.now().add(Duration(days: 90)),
                  ),
                ),
                SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: TimePickerDialog(initialTime: TimeOfDay.now()))
              ],
            ),
          ),
        );
      },
    );
  }
}
