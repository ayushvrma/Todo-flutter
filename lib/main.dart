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
  Box<Task> taskBox;
  @override
  void initState() async {
    super.initState();
    taskBox = Hive.box('tasks');
  }

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Color(0xff0D3257),
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add New Task'),
                content: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Enter task"),
                    autofocus: true),
                actions: <Widget>[
                  TextButton(
                    child: Text('SAVE'),
                    onPressed: () {
                      taskBox.add(Task('title', false));
                    },
                  ),
                ],
              );
            }),
        child: Icon(Icons.add),
      ),
    );
  }
}
