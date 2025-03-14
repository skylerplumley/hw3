import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Matching',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Cards {
  final String front;
  final String back = 'assets/backofcard.jpg';
  bool flipped;

  Cards({required this.front, this.flipped = false});
}

class _MyHomePageState extends State<MyHomePage> {
  List<Cards> cards = [];
  List<int> flippedcards = [];

  void createdeck() {
    List<String> fronts = [
      'assets/card2.png',
      'assets/card3.png',
      'assets/card4.png',
      'assets/card5.png',
      'assets/card6.png',
      'assets/card7.png',
      'assets/card8.png',
      'assets/card9.png',
    ];
  }

  void flip(int index) {
    /*
    if (flippedcards.length == 2) {
      matchtest()
    } else {
    */
    setState(() {
      cards[index].flipped = true;
      flippedcards.add(index);
    });
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.2,
            ),
            itemCount: 16,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => flip(index),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        cards[index].flipped
                            ? cards[index].front
                            : cards[index].back,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
