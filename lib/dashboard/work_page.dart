import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_aap/dashboard/homePage.dart';
import 'package:task_aap/dashboard/mywork_page.dart';
import 'package:task_aap/dashboard/new_work.dart';

class WorkPage extends StatefulWidget {
  String date;
  String title;
  String des;
  String comment;

  WorkPage(
      {required this.date,
      required this.title,
      required this.des,
      required this.comment});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<Info> items = [];

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("My Tasks"),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPage()));
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // ListTile(
                      //   title: Text(
                      //     'Current Date: $formattedDate',
                      //     style: const TextStyle(fontSize: 20),
                      //   ),
                      // ),
                      Text(
                        formattedDate.toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Work1()));
                        },
                        child: const Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "ForView...",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),

                      IconButton(
                          onPressed: () {
                            deleteItem(index);
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  );
                }),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.teal[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      icon: const Icon(
                        Icons.home,
                        size: 40,
                        //color: Colors.purpleAccent,
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
        ));
  }

// void deleteItem(int index) {
//   setState(() {
//     data.removeAt(index);
//   });
// }
}

class Info {
  String date;
  String title;
  String dis;
  String comment;

  Info(this.date, this.title, this.dis, this.comment);
}
