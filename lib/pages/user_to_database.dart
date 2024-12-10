import 'package:flutter/material.dart';
import 'package:inventory_project/database/local_db.dart';

class DatabaseUserInterface extends StatelessWidget {
  const DatabaseUserInterface({super.key});

  @override
  Widget build(BuildContext context) {
    var prdNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Database interface'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                TextField(
                  decoration: const InputDecoration(hintText: 'Product name'),
                  controller: prdNameController,
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration:
                      const InputDecoration(hintText: 'Product Quantity'),
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(hintText: 'Product Price'),
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                const Text(
                  '',
                  style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          await LocalDatabase()
                              .addDataLocally(prdName: prdNameController.text);
                        },
                        child: const Text('Save to database')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/home');
                      },
                        child: const Text('Show Product')),
                    
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
