import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<Map<String, String>> todoList = [];
  final TextEditingController taskController = TextEditingController();

  void addList() {
    if (taskController.text.trim().isNotEmpty) {
      setState(() {
        todoList.add({"value": taskController.text.trim()});
        taskController.clear();
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "To-Do List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: todoList.isEmpty
                ? const Center(
                    child: Text(
                      "No tasks yet. Add a new task!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.blue[900],
                        child: ListTile(
                          title: Text(
                            todoList[index]['value']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              deleteItem(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // TextFormField
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: taskController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: Colors.indigo[50],
                      filled: true,
                      labelText: 'Create a new Task...',
                      labelStyle: const TextStyle(
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Elevated Button
                SizedBox(
                  height: 60, // Matches the height of the TextFormField
                  child: ElevatedButton(
                    onPressed: addList,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
