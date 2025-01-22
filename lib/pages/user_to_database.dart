import 'package:flutter/material.dart';
import 'package:inventory_project/database/local_db.dart';

class DatabaseUserInterface extends StatefulWidget {
  const DatabaseUserInterface({super.key});

  @override
  State<DatabaseUserInterface> createState() => _DatabaseUserInterfaceState();
}

class _DatabaseUserInterfaceState extends State<DatabaseUserInterface> {
  @override
  Widget build(BuildContext context) {
    var prdNameController = TextEditingController();
    var prdIdController = TextEditingController();
    var prdQtyController = TextEditingController();
    var prdPriceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Database interface'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          TextField(
            decoration: const InputDecoration(hintText: 'prd Id'),
            controller: prdIdController,
            style: const TextStyle(color: Colors.black, fontSize: 12.0),
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Product name'),
            controller: prdNameController,
            style: const TextStyle(color: Colors.black, fontSize: 12.0),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(hintText: 'Product Quantity'),
            controller: prdQtyController,
            style: const TextStyle(color: Colors.black, fontSize: 12.0),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(hintText: 'Product Price'),
            controller: prdPriceController,
            style: const TextStyle(color: Colors.black, fontSize: 12.0),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await LocalDatabase().addDataLocally(
                        prdName: prdNameController.text,
                        prdQtY: int.parse(prdQtyController.text),
                        prdPrice: double.parse(prdPriceController.text));
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
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    List prdSearchListMap = await LocalDatabase()
                        .searchProductById(
                            prdId: int.parse(prdIdController.text));
                    if (prdSearchListMap.isNotEmpty) {
                      prdNameController.text = prdSearchListMap[0]["prdName"];
                      prdPriceController.text =
                          prdSearchListMap[0]["prdPrice"].toString();
                      prdQtyController.text =
                          prdSearchListMap[0]["prdQty"].toString();
                    } else {
                      prdNameController.text = "Not Found";
                    }
                  },
                  child: const Text('Search Product')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await LocalDatabase().updateProduct(
                        prdId: int.parse(prdIdController.text),
                        prdName: prdNameController.text,
                        prdQty: int.parse(prdQtyController.text),
                        prdPrice: double.parse(prdPriceController.text));
                  },
                  child: const Text('update Product')),
            ],
          ),
        ]),
      ),
    );
  }
}