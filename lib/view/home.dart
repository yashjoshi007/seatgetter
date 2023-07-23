import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SeatFinderView.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late int enteredNumber = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  initState() {
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Seat Finder",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextField(
                  focusNode: FocusNode(),
                  showCursor: true,
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Seat Number...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      try {
                        enteredNumber = int.parse(_controller.text);
                        if (!(enteredNumber > 0 && enteredNumber <= 80)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Seat Number: $enteredNumber is invalid')));
                          _controller.clear();
                          enteredNumber=0;
                        }
                      } catch (e) {
                        if (e is FormatException) {
                          print("Invalid Format");
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('Seat Number is invalid')));
                          _controller.clear();
                          enteredNumber=0;
                        }
                      }
                    });
                  },
                  // enabled:,
                ),
              ),

              Expanded(child: FinderPageView(seatNumber: enteredNumber)),
            ],
          ),
        ),
      ),
    );
  }
}