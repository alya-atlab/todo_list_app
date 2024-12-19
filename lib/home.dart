import 'package:flutter/material.dart';
import 'package:todolist/taskitem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController taskController = TextEditingController();
  void _openCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        print("Selected Date: $selectedDate");
      }
    });
  }

  void _addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({'task': taskController.text, 'isCompleted': false});
        taskController.clear();
      });
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14151F),
      appBar: AppBar(
        backgroundColor: Color(0xFF14151F),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
          decoration: BoxDecoration(
            color: Color(0xFF2C2C2E),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            'To do list',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Row(
            children: [
              Text(
                'Today',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today, color: Colors.white),
                onPressed: () => _openCalendar(context),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: taskitem()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: taskController,
                          decoration: InputDecoration(
                            hintText: 'Enter new task',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // Add button
                      IconButton(
                        icon: Icon(Icons.add, color: Color(0xFF14151F)),
                        onPressed: _addTask,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
