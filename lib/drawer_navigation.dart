import 'package:flutter/material.dart';
import 'package:frequence_list_guru_v1/frequency_list.dart';
import 'package:frequence_list_guru_v1/task_list_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Task',
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                'Version',
                style: TextStyle(fontSize: 15),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/task_list.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Task List'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TaskListScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list_rounded),
              title: Text('Frequency List'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FrequencyList()));
              },
            )
          ],
        ),
      ),
    );
  }
}
