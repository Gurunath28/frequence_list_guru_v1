import 'package:flutter/material.dart';
import 'package:frequence_list_guru_v1/frequency_list.dart';
import 'package:frequence_list_guru_v1/task_list_screen.dart';

import 'data_base_helper.dart';

final dbHelper = DataBaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initilzation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:TaskListScreen(),
    );
  }
}
