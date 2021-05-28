import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _wisdomState();
}

class _wisdomState extends State<Wisdom> {
  List quotes = [
    "I love to be alone",
    "Try to be alone",
    "You will feel the meaning of a company",
    "Try to find a company",
    "Have successful peace of mind with happiness in you"
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                        child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16.5,
                          color: Colors.grey.shade600),
                    ))),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.greenAccent.shade700,
                icon: Icon(Icons.wb_sunny),
                label: Text(
                  "Inspire me!",
                  style: TextStyle(fontSize: 18.8, color: Colors.white),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    // Increment our index/counter by 1
    setState(() {
      _index += 1;
    });
  }
}
