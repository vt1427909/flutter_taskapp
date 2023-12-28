import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_aap/dashboard/work_page.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )),
                  labelText: 'Date'),
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )),
                  labelText: 'Title'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )),
                  labelText: 'Description'),
            ),
            TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 50.0,
                    horizontal: 15.0,
                  ),
                  labelText: 'Comment'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Center(
                        child: Text(
                          "Are You Sure?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      // content: const Text("Are you sure ?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xffff5f6d),
                                  Color(0xffff5f6d),
                                  Color(0xffffc371),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "CANCEL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkPage(
                                          date: dateController.text,
                                          title: titleController.text,
                                          des: descriptionController.text,
                                          comment: commentController.text,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xffff5f6d),
                                  Color(0xffff5f6d),
                                  Color(0xffffc371),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "CONFIRM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const WorkPage(),
                  //         settings: RouteSettings(arguments: [
                  //           date,
                  //           title,
                  //           description,
                  //           comment,
                  //         ])));
// Perform actions with the data, for example, print them
                  String date = dateController.text;
                  String title = titleController.text;
                  String description = descriptionController.text;
                  String comment = commentController.text;
                  print('Date: $date');
                  print('Title: $title');
                  print('Description: $description');
                  print('Comment: $comment');
                },
                // padding: const EdgeInsets.all(0),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xffff5f6d),
                        Color(0xffff5f6d),
                        Color(0xffffc371),
                      ],
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                        maxWidth: double.infinity, minHeight: 50),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
