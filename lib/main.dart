import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'models/tasks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);
//  Hive.initFlutter((await getApplicationDocumentsDirectory()).path);

  Hive.registerAdapter<Task>(TaskAdapter());
  await Future.wait([Hive.openBox<Task>('tasks')]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color(0xff0D3257)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  static const String routeName = '';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Box<Task> taskBox;
  // @override
  // void initState() async {
  //   super.initState();
  //   taskBox = Hive.box('tasks');
  // }

  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Box<Task> taskBox = Hive.box('tasks');
    return Scaffold(
      body: ValueListenableBuilder<Box<dynamic>>(
        valueListenable: taskBox.listenable(),
        builder: (_, Box<dynamic> taskBox, __) {
          return ListView.builder(
            itemBuilder: (_, int index) {
              return Text(taskBox.getAt(index).title);
            },
            itemCount: taskBox.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a Task',
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      taskBox.add(Task(myController.text, false));
                      myController.text = '';
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Entered the task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
