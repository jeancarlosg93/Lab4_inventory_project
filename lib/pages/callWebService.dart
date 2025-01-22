import 'package:flutter/material.dart';
import 'package:http/http.dart';


class CallBillingResource extends StatelessWidget {
  const CallBillingResource({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Inventory'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "prdName",
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    getBillingData();
                  },
                  child: Text('Web Service Billing'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getBillingData() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    Response response = await get(uri);
    print(response.body);
  }
}