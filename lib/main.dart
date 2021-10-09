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
  await Future.wait([Hive.openBox<Task>('notes')]);
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
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<String> tasksBox;
  TextEditingController _textFieldController = TextEditingController();

  void onAddTask() {
    if (_textFieldController.text.isNotEmpty) {
      tasksBox.add(_textFieldController.text);
      Navigator.pop(context);
      _textFieldController.clear();
      return;
    }
  }

  void onDeleteTask(int index) {
    tasksBox.deleteAt(index);
    return;
  }

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box("tasksBox");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('oyus'),
        ),
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
                    onPressed: () => onAddTask(),
                  ),
                ],
              );
            }),
        child: Icon(Icons.add),
      ),
    );
  }
}
