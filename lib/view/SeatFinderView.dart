import 'package:flutter/material.dart';
// For state management based on Scrolling
class FinderPageView extends StatefulWidget {
  const FinderPageView({Key? key, required this.seatNumber}) : super(key: key);
  final int seatNumber;

  @override
  _FinderPageViewState createState() => _FinderPageViewState();
}

class _FinderPageViewState extends State<FinderPageView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FinderPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToSeat(widget.seatNumber);
  }

  void _scrollToSeat(int seatNumber) {
    if (mounted) {
      final seatIndex = (seatNumber - 1) ~/ 8;
      _scrollController.animateTo(
        seatIndex * (50 * 3 + 25),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SeatList(
                itemCount: 10,
                enteredNumber: widget.seatNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Breaking Into Components
class SeatList extends StatelessWidget {
  const SeatList({Key? key, required this.itemCount, required this.enteredNumber})
      : super(key: key);
  final int itemCount;
  final int enteredNumber;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return SeatFinder(
          index: index * 8 + 1,
          find: enteredNumber, // Use enteredNumber instead of widget.seatNumber
        );
      },
    );
  }
}
//----------------
// FOr UI of page according to Railway Seats
class SeatFinder extends StatelessWidget {

  SeatFinder({Key? key, required this.index, required this.find})
      : super(key: key);

  final int find;
  final int index;

  final Border b = const Border(
    top: BorderSide(width: 2, color: Colors.blueAccent),
    left: BorderSide(width: 2, color: Colors.blueAccent),
    right: BorderSide(width: 2, color: Colors.blueAccent),
    bottom: BorderSide(width: 2, color: Colors.blueAccent),
  );
  final containerPadding = const EdgeInsets.all(2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: find == index
                                ? Colors.grey
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Lower",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: containerPadding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: find == index + 1
                                ? Colors.greenAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Middle",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: containerPadding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: find == index + 2
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index + 2).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Upper",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: containerPadding,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: find == index + 6
                                ? Colors.grey
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index + 6).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text("Side\nLower",
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: containerPadding,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: find == index + 3
                                ? Colors.grey
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index + 3).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Lower",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: containerPadding,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: find == index + 4
                                ? Colors.greenAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index + 4).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Middle",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: containerPadding,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: find == index + 5
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index + 5).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Upper",
                                    style: TextStyle(
                                        fontSize: 9, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: containerPadding,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: find == index + 7
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: b,
                          ),
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    (index + 7).toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Side\nUpper",
                                    style: TextStyle(
                                        fontSize: 9, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),

    );
  }
}