import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManagementRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Management'),
          actions: [
            IconButton(
                onPressed: () {
                  context.goNamed('management');
                },
                icon: const Icon(Icons.playlist_add_check)),
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
                    Text('Request',
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
                    'June',
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
                            '2023/06/20',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          _buidRequest(context,
                              '10:00 - 12:00  |  Team 3  |  meeting with FPT'),
                          SizedBox(height: 8),
                          _buidRequest(context,
                              '10:00 - 12:00  |  Team 1  |  team meeting'),
                          SizedBox(height: 24),
                          Text(
                            '2023/06/23',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          _buidRequest(context,
                              '14:00 - 15:00  |  Team 4  |  meeting with Viettel'),
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
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(24)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text('Accept',
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
                  child: Text('Reject',
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
