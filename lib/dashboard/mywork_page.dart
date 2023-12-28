import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'homePage.dart';

class Work1 extends StatefulWidget {
  const Work1({super.key});

  @override
  State<Work1> createState() => _Work1State();
}

class _Work1State extends State<Work1> {
  List<String> items = ['Date', 'Title', 'Status', 'View', 'Edit', 'Delete'];

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("My Work"),
          GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MyPage()));
              },
              child: const Text("Add Work"))
        ],
      )),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      formattedDate.toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Title",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Status:Pending",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "View...",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          deleteItem(index);
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                );
              }),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.teal[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 40,
                      // color: Colors.purpleAccent,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      size: 40,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
// Text("Date"),
// Text("Title"),
// Text("Statsu"),
// Text("View"),
// Text("Edit Details"),
