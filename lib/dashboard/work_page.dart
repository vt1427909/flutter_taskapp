import 'package:flutter/material.dart';
import 'package:task_aap/dashboard/mywork_page.dart';
import 'package:task_aap/dashboard/new_work.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  TextEditingController _textEditingController = TextEditingController();
  String _displayText = '';

  void _updateText() {
    setState(() {
      // Update the displayed text with the text from the controller.
      _displayText = _textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Date",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "For View",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      print("fgfg");
                      // deleteItem(index);
                    },
                    child: const Text(
                      "Delete",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            }));
  }

// void deleteItem(int index) {
//   setState(() {
//     data.removeAt(index);
//   });
// }
}
