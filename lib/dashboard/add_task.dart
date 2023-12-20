import 'package:flutter/material.dart';

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
                    labelText: 'Color'),
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
                    String name = nameController.text;
                    String date = dateController.text;
                    String Color = colorController.text;
                    String Notes = notesController.text;
                    String website = websiteController.text;
                    String reson = resonController.text;

                    if (name.isNotEmpty &&
                        date.isNotEmpty &&
                        Color.isNotEmpty &&
                        Notes.isNotEmpty &&
                        reson.isNotEmpty &&
                        website.isNotEmpty) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePage(
                      //         // userData: UserData(
                      //         //     name: name,
                      //         //     date: date,
                      //         //     color: Color,
                      //         //     notes: Notes,
                      //         //     website: website,
                      //         //     reson: reson),
                      //         ),
                      //   ),
                      // );
                    } else
                      (e) {
                        e.toString();
                        // Show an error or handle the case when any field is empty
                      };
                    print('Date: ${dateController.text}');
                    print('Name: ${nameController.text}');
                    print('For: ${resonController.text}');
                    print('Color: ${colorController.text}');
                    print('Notes: ${notesController.text}');
                    print('Website URL: ${websiteController.text}');
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
                        "Summit",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
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
