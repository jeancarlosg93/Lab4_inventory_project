import 'package:flutter/material.dart';
import 'package:inventory_project/pages/selected_product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> prdNameList = <String>[
    'Cookies',
    'bread',
    'Eggs',
    'Meat',
    'Wheat'
  ];
  List<int> prdQtyList = <int>[5, 2, 3, 10, 7];
  List<double> prdPriceList = <double>[15.99, 12.99, 13.99, 10.99, 7.99];
  int currentProdIndex = -1;
  int prdQty = 0;
  String prdName = '';
  double prdPrice = 0.0;
  double prdtotal = 0.00;

  @override
  void initState() {
    super.initState();
    getProductData();
  }

  void getProductData() async {
    // prdName = await Future.delayed(const Duration(seconds: 3), () {
    //   return ('Delayed');
    // });
    //
    // prdPrice = await Future.delayed(const Duration(seconds: 2), () {
    //   print('product qty is 2');
    // });
  }

  @override
  Widget build(BuildContext context) {
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
                Text(
                  prdName,
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                Text(
                  prdQty.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                Text(
                  prdPrice.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                Text(
                  prdtotal.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Calculate')),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentProdIndex =
                                (currentProdIndex + 1) % prdQtyList.length;
                            prdName = prdNameList[currentProdIndex];
                            prdQty = prdQtyList[currentProdIndex];
                            prdPrice = prdPriceList[currentProdIndex];
                            prdtotal = prdQty * prdPrice;
                          });
                        },
                        child: const Icon(Icons.arrow_forward)),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () async {
                          
                          //this is a map
                          final updateProducts = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => selectedProduct(
                                      prdName: prdNameList[currentProdIndex],
                                      prdPrice: prdPriceList[currentProdIndex],
                                      prdQty: prdQtyList[currentProdIndex])));
                          
                          setState(() {
                            prdName = updateProducts["prdName"];
                            prdQty = updateProducts["prdQty"];
                            prdPrice = updateProducts["prdPrice"];
                            
                            prdNameList[currentProdIndex] = prdName;
                            prdPriceList[currentProdIndex] = prdPrice;
                            prdQtyList[currentProdIndex] = prdQty;
                          });
                        },
                        child: const Text('Edit product '
                            'details')),
                  ],
                ),
                const SizedBox(height: 20),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.network(
                  'https://random.dog/86a6af7a-eee8-4c04-8730-8656593f34d9.gif',
                  height: 200,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/dog1.jpg',
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 200,
                  child: Image.network(
                    'https://random.dog/1f1d51c0-cdf7-4efb-8ae0-ecd7d6f73481.jpeg',
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
