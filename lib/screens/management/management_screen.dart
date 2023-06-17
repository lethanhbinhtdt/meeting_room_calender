import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Management'),
          actions: [
            IconButton(
                onPressed: () {
                  context.goNamed('management_request');
                },
                icon: const Icon(Icons.playlist_add)),
            SizedBox(width: 8),
            IconButton(
                onPressed: () {
                  context.goNamed('home');
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(width: 18)
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text('Management',
                        style: TextStyle(
                            color: Color.fromARGB(255, 85, 61, 95),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    Text('Management',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios, size: 20),
                  SizedBox(width: 16),
                  Text(
                    'May',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.arrow_forward_ios, size: 20),
                ],
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4)),
                height: MediaQuery.of(context).size.height * 0.6,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2023/05/16',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          _buidRequest(context,
                              '11:00 - 12:00  |  Team 2  |  meeting with FPT'),
                          SizedBox(height: 8),
                          _buidRequest(context,
                              '15:30 - 16:30  |  Team 3  |  team meeting'),
                          SizedBox(height: 24),
                          Text(
                            '2023/05/23',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          _buidRequest(context,
                              '08:00 - 09:00  |  Team 1  |  team meeting'),
                          _buidRequest(context,
                              '09:30 - 10:30  |  Team 2  |  team meeting'),
                          _buidRequest(context,
                              '11:00 - 12:00  |  Team 3  |  team meeting'),
                          _buidRequest(context,
                              '13:00 - 14:00  |  Team 4  |  team meeting'),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buidRequest(BuildContext context, String text) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
      Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text('Edit',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                )),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(24)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text('Cancle',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                )),
          )
        ],
      ),
    ]);
  }
}
