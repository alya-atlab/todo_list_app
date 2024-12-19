import 'package:flutter/material.dart';

List<Map<String, dynamic>> tasks = [];

class taskitem extends StatefulWidget {
  const taskitem({super.key});

  @override
  State<taskitem> createState() => _taskitemState();
}

class _taskitemState extends State<taskitem> {
  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['isCompleted'] = !tasks[index]['isCompleted'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Color(0xFF14151F),
            child: Column(
              children: [
                Expanded(
                  child: tasks.where((task) => !task['isCompleted']).isEmpty
                      ? Center(
                          child: Text(
                            'No New Tasks',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: tasks
                              .where((task) => !task['isCompleted'])
                              .length,
                          itemBuilder: (context, index) {
                            final newTasks = tasks
                                .where((task) => !task['isCompleted'])
                                .toList();
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: ListTile(
                                leading: Checkbox(
                                  value: newTasks[index]['isCompleted'],
                                  onChanged: (value) {
                                    _toggleTaskCompletion(
                                        tasks.indexOf(newTasks[index]));
                                  },
                                  checkColor: Colors.black,
                                  activeColor: Colors.white,
                                ),
                                title: Text(
                                  newTasks[index]['task'],
                                  style: TextStyle(color: Color(0xFF14151F)),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.1,
          height: 1.0,
        ),
        Expanded(
          child: Container(
            color: Color(0xFF14151F),
            child: Column(
              children: [
                Expanded(
                  child: tasks.where((task) => task['isCompleted']).isEmpty
                      ? Center(
                          child: Text(
                            'No Completed Tasks',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              tasks.where((task) => task['isCompleted']).length,
                          itemBuilder: (context, index) {
                            final completedTasks = tasks
                                .where((task) => task['isCompleted'])
                                .toList();
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                              leading: Checkbox(
                                value: completedTasks[index]['isCompleted'],
                                onChanged: (value) {
                                  _toggleTaskCompletion(
                                      tasks.indexOf(completedTasks[index]));
                                },
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                              ),
                              title: Text(
                                completedTasks[index]['task'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
