import 'package:flutter/material.dart';

class selectedProduct extends StatelessWidget {
  final String prdName;
  final int prdQty;
  final double prdPrice;

  const selectedProduct(
      {super.key,
      required this.prdName,
      required this.prdQty,
      required this.prdPrice});

  @override
  Widget build(BuildContext context) {
    var prdNameController = TextEditingController();
    var prdQtyController = TextEditingController();
    var prdPriceController = TextEditingController();
    prdNameController.text = prdName;
    prdQtyController.text = prdQty.toString();
    prdPriceController.text = prdPrice.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Inventory'),
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
                const Text(
                  '',
                  style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, {
                            'prdName': prdNameController.text,
                            'prdQty': prdQtyController.text,
                            'prdPrice': prdPriceController.text,
                          });
                        },
                        child: const Text('update product')),
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
