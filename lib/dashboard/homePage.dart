// import 'package:flutter/material.dart';
// import 'package:task_aap/dashboard/work_page.dart';
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   int currentPageIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: (int index) {
//           setState(() {
//              currentPageIndex = index;
//
//           });
//         },
//         indicatorColor: Colors.amber,
//         selectedIndex: currentPageIndex,
//         destinations: [
//           InkWell(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const WorkPage()));
//             },
//             child: const NavigationDestination(
//               selectedIcon: Icon(Icons.task),
//               icon: Icon(Icons.task),
//               label: 'My Task',
//             ),
//           ),
//           NavigationDestination(
//             icon: Text(""),
//             // icon: Badge(
//             //     child: Icon(Icons.notifications_sharp)),
//             label: '',
//           ),
//           const NavigationDestination(
//             icon: Badge(
//               // label: Text('2'),
//               child: Icon(Icons.person),
//             ),
//             label: 'My  Profile',
//           ),
//         ],
//       ),
//       body: <Widget>[
//         /// Home page
//         Card(
//           shadowColor: Colors.transparent,
//           margin: const EdgeInsets.all(8.0),
//           child: SizedBox.expand(
//             child: Center(
//               child: Text(
//                 'Home page',
//                 style: theme.textTheme.titleLarge,
//               ),
//             ),
//           ),
//         ),
//
//         /// Notifications page
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               Card(
//                 child: ListTile(
//                   leading: Icon(Icons.notifications_sharp),
//                   title: Text('Notification 1'),
//                   subtitle: Text('This is a notification'),
//                 ),
//               ),
//               Card(
//                 child: ListTile(
//                   leading: Icon(Icons.notifications_sharp),
//                   title: Text('Notification 2'),
//                   subtitle: Text('This is a notifica'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         /// Messages page
//         ListView.builder(
//           reverse: true,
//           itemCount: 2,
//           itemBuilder: (BuildContext context, int index) {
//             if (index == 0) {
//               return Align(
//                 alignment: Alignment.centerRight,
//                 child: Container(
//                   margin: const EdgeInsets.all(8.0),
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.primary,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Text(
//                     'Hello',
//                     style: theme.textTheme.bodyLarge!
//                         .copyWith(color: theme.colorScheme.onPrimary),
//                   ),
//                 ),
//               );
//             }
//             return Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 margin: const EdgeInsets.all(8.0),
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.primary,
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Text(
//                   'Hi!',
//                   style: theme.textTheme.bodyLarge!
//                       .copyWith(color: theme.colorScheme.onPrimary),
//                 ),
//               ),
//             );
//           },
//         ),
//       ][currentPageIndex],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:task_aap/dashboard/add_task.dart';
import 'package:task_aap/dashboard/work_page.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     FirstPage(),
//     SecondPage(),
//     //ThirdPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //     // title: Text('Bottom Navigation Bar Example'),
//       //     ),
//       body:
//       _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> data = ['Item 1', 'Item 2', 'Item 3'];
  // TextEditingController _editingController = TextEditingController();
  //
  // void deleteItem(int index) {
  //   setState(() {
  //     data.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddTask()));
                      },
                      icon: const Text(
                        "Add Task",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: data.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(data[index]),
            //       trailing: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           IconButton(
            //             icon: const Icon(Icons.edit),
            //             onPressed: () {
            //               // Handle editing here
            //               showDialog(
            //                 context: context,
            //                 builder: (BuildContext context) {
            //                   return AlertDialog(
            //                     title: const Text('Edit Item'),
            //                     content: TextField(
            //                       controller: _editingController,
            //                       decoration:
            //                           InputDecoration(labelText: 'Edit item'),
            //                     ),
            //                     actions: [
            //                       TextButton(
            //                         onPressed: () {
            //                           setState(() {
            //                             data[index] = _editingController.text;
            //                             _editingController.clear();
            //                             Navigator.pop(context);
            //                           });
            //                         },
            //                         child: const Text('Save'),
            //                       ),
            //                     ],
            //                   );
            //                 },
            //               );
            //             },
            //           ),
            //           IconButton(
            //             icon: const Icon(Icons.delete),
            //             onPressed: () {
            //               // Handle deletion here
            //               deleteItem(index);
            //             },
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "My Pending Task",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "My Complete Task",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "My OverDue Task",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "My Approval Task",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "My Rejected Task",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkPage(
                                      date: '',
                                      title: '',
                                      des: '',
                                      comment: '',
                                    )));
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
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Business Page'),
    );
  }
}

// class ThirdPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('School Page'),
//     );
//   }
// }
