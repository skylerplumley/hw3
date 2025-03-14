import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final String back;
  bool flipped;

  Cards({required this.front, required this.back, this.flipped = false});
}

class _MyHomePageState extends State<MyHomePage> {
  List<Cards> cards = [];
  List<int> flippedcards = [];

  @override
  void initState() {
    super.initState();
    createdeck();
  }

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

    List<Cards> doubles = [];
    for (String front in fronts) {
      doubles.add(Cards(front: front, back: 'assets/backofcard.jpg'));
      doubles.add(Cards(front: front, back: 'assets/backofcard.jpg'));
    }

    setState(() {
      cards = doubles;
      cards.shuffle();
    });
  }

  void flip(int index) {
    if (!cards[index].flipped && flippedcards.length < 2) {
      setState(() {
        cards[index].flipped = true;
        flippedcards.add(index);
      });

      if (flippedcards.length == 2) {
        checkmatch();
      }
    }
  }

  void checkmatch() {
    Future.delayed(Duration(seconds: 1), () {
      if (cards[flippedcards[0]].front != cards[flippedcards[1]].front) {
        setState(() {
          cards[flippedcards[0]].flipped = false;
          cards[flippedcards[1]].flipped = false;
        });
      }
      flippedcards.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Card Matching Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: cards.length,
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
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
