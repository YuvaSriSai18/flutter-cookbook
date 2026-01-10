import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class CurrencyConverterHomePage extends StatefulWidget {
  const CurrencyConverterHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _CurrencyConverterHomePageState();
}

class _CurrencyConverterHomePageState extends State {
  double res = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Initialized");
    // https://jsonplaceholder.typicode.com/users
    // var url = Uri.https('jsonplaceholder.typicode.com', '/users');
    // var response = await http.get(url);
    // print(response.body);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilt again");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Currency Convertor",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 120,
            width: double.infinity,

            // foregroundDecoration: ShapeDecoration(
            //   shape: BeveledRectangleBorder(
            //     side: BorderSide(width: 2),
            //     borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
            //   ),
            // ),
            // decoration: BoxDecoration(
            //   color: Colors.blue[300],
            //   shape: BoxShape.rectangle,
            //   borderRadius: BorderRadius.all(Radius.circular(14)),

            //   // border: Border.all(width: 1),
            // ),
            child: Center(
              child: Text(
                "INR ${res != 0 ? res.toStringAsFixed(2) : "0"}",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              controller: textEditingController,
              onSubmitted: (value) => {print(value)},
              decoration: InputDecoration(
                labelText: "Enter value in INR",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                prefixIcon: Icon(Icons.monetization_on),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              if (!kDebugMode) {
                debugPrint("Not in Debug mode");
              } else {
                debugPrint("In Debug mode");
                print(
                  "Entered value ${double.parse(textEditingController.text) * 81}",
                );
                setState(() {
                  res = double.parse(textEditingController.text) * 81;
                });
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
              ),
              textStyle: TextStyle(fontSize: 16),
            ),
            child: Text("Convert"),
          ),
        ],
      ),
    );
  }
}

class CurrencyConverterHomePagee extends StatelessWidget {
  const CurrencyConverterHomePagee({super.key});

  @override
  Widget build(BuildContext context) {
    double res = 0;
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Currency Convertor",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 120,
            width: 120,

            // foregroundDecoration: ShapeDecoration(
            //   shape: BeveledRectangleBorder(
            //     side: BorderSide(width: 2),
            //     borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
            //   ),
            // ),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(14)),

              // border: Border.all(width: 1),
            ),
            child: Center(
              child: Text(
                res.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              controller: textEditingController,
              onSubmitted: (value) => {print(value)},
              decoration: InputDecoration(
                labelText: "Enter value in INR",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                prefixIcon: Icon(Icons.monetization_on),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              if (!kDebugMode) {
                debugPrint("Not in Debug mode");
              } else {
                debugPrint("In Debug mode");
                print(
                  "Entered value ${double.parse(textEditingController.text) * 81}",
                );
                res = double.parse(textEditingController.text) * 81;
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
              ),
              textStyle: TextStyle(fontSize: 16),
            ),
            child: Text("Convert"),
          ),
        ],
      ),
    );
  }
}
