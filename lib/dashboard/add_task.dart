import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:task_aap/dashboard/homePage.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController resonController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  Color mycolor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2025),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      dateController.text =
                          DateFormat('dd-MM-yyyy').format(selectedDate);
                    }
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter date.';
                  }
                  return null;
                },
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
                  labelText: 'Date',
                  // suffixIcon: IconButton(
                  //   icon: Icon(Icons.calendar_today),
                  //   onPressed: () => _selectDate(context),
                  // ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
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
                    labelText: 'Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: resonController,
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
                    labelText: 'For'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: colorController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.red,
                  // icon: IconButton(
                  //     onPressed: () {
                  //       showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) {
                  //             return AlertDialog(
                  //               title: Text('Pick a color!'),
                  //               content: SingleChildScrollView(
                  //                 child: ColorPicker(
                  //                   pickerColor: mycolor, //default color
                  //                   onColorChanged: (Color color) {
                  //                     //on color picked
                  //                     setState(() {
                  //                       mycolor = color;
                  //                     });
                  //                   },
                  //                 ),
                  //               ),
                  //               actions: <Widget>[
                  //                 ElevatedButton(
                  //                   child: const Text('DONE'),
                  //                   onPressed: () {
                  //                     Navigator.of(context)
                  //                         .pop(); //dismiss the color picker
                  //                   },
                  //                 ),
                  //               ],
                  //             );
                  //           });
                  //     },
                  //     icon: Icon(Icons.format_color_fill)),
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
                  labelText: 'Color',
                  suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: mycolor, //default color
                                    onColorChanged: (Color color) {
                                      //on color picked
                                      setState(() {
                                        mycolor = color;
                                      });
                                    },
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('DONE'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); //dismiss the color picker
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      icon: Icon(Icons.format_color_fill)),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: notesController,
                decoration: InputDecoration(
                    // labelStyle:
                    //     TextStyle(fontSize: 14, color: Colors.grey.shade600),
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
                    labelText: 'Notes'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: websiteController,
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
                    labelText: 'Website URL'),
              ),
              const SizedBox(height: 20),
              Container(
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
                                      builder: (context) => HomePage()));
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
                  },
                  // onPressed: () {
                  //   String name = nameController.text;
                  //   String date = dateController.text;
                  //   String Color = colorController.text;
                  //   String Notes = notesController.text;
                  //   String website = websiteController.text;
                  //   String reson = resonController.text;
                  //
                  //   if (name.isNotEmpty &&
                  //       date.isNotEmpty &&
                  //       Color.isNotEmpty &&
                  //       Notes.isNotEmpty &&
                  //       reson.isNotEmpty &&
                  //       website.isNotEmpty) {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => HomePage()));
                  //     AlertDialog(
                  //       title: Text('Welcome!'),
                  //       content: Text('Are you sure'),
                  //       actions: [
                  //         ElevatedButton(
                  //           onPressed: () {},
                  //           child: Text('CANCEL'),
                  //         ),
                  //         ElevatedButton(
                  //           onPressed: () {},
                  //           child: Text('ACCEPT'),
                  //         ),
                  //       ],
                  //     );
                  //   } else
                  //     (e) {
                  //       e.toString();
                  //       // Show an error or handle the case when any field is empty
                  //     };
                  //   print('Date: ${dateController.text}');
                  //   print('Name: ${nameController.text}');
                  //   print('For: ${resonController.text}');
                  //   print('Color: ${colorController.text}');
                  //   print('Notes: ${notesController.text}');
                  //   print('Website URL: ${websiteController.text}');
                  // },
                  // padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
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
                    constraints: const BoxConstraints(
                        maxWidth: double.infinity, minHeight: 50),
                    child: const Text(
                      "Summit",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Access the entered values using the controllers
              //     print('Date: ${dateController.text}');
              //     print('Name: ${nameController.text}');
              //     print('For: ${forController.text}');
              //     print('Color: ${colorController.text}');
              //     print('Notes: ${notesController.text}');
              //     print('Website URL: ${websiteController.text}');
              //   },
              //   child: Text('Submit'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// class UserData {
//   String name;
//   String date;
//   String reson;
//   String color;
//   String notes;
//   String website;
//
//   UserData({
//     required this.name, required this.date, required this.reson,
//     required this.color, required this.notes, required this.website,
//   })
// }
