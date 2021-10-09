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
  static const String routeName = '';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Box<Task> taskBox = Hive.box('tasks');
    return Scaffold(
      body: ValueListenableBuilder<Box<dynamic>>(
        valueListenable: taskBox.listenable(),
        builder: (_, Box<dynamic> noteBox, __) {
          return ListView.builder(
            itemBuilder: (_, int index) {
              return Text(noteBox.getAt(index).title);
            },
            itemCount: noteBox.length,
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
