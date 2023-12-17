import 'package:flutter/material.dart';

class Work1 extends StatefulWidget {
  const Work1({super.key});

  @override
  State<Work1> createState() => _Work1State();
}

class _Work1State extends State<Work1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Work"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, int index) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Date",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Statsu",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "Edit Details",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.edit),
                  ],
                )
              ],
            );
          }),
    );
  }
}
// Text("Date"),
// Text("Title"),
// Text("Statsu"),
// Text("View"),
// Text("Edit Details"),
