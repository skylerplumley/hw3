import 'package:flutter/material.dart';
//https://en.wikipedia.org/wiki/File:English_pattern_4_of_clubs.svg
//https://en.wikipedia.org/wiki/File:English_pattern_9_of_clubs.svg
//https://en.wikipedia.org/wiki/File:English_pattern_8_of_diamonds.svg
//https://en.wikipedia.org/wiki/File:English_pattern_3_of_diamonds.svg
//https://en.wikipedia.org/wiki/File:English_pattern_6_of_spades.svg
//https://en.wikipedia.org/wiki/File:English_pattern_2_of_spades.svg
//https://en.wikipedia.org/wiki/File:English_pattern_5_of_hearts.svg
//https://en.wikipedia.org/wiki/File:English_pattern_7_of_hearts.svg
//https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.allstardogs.com%2FPages%2FSchools%2FGeorgiaState.html&psig=AOvVaw2umqmOTJh2Kk2Bck1TH9Zp&ust=1742001177093000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKDvwJyyiIwDFQAAAAAdAAAAABAE

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

class _MyHomePageState extends State<MyHomePage> {
  final String backofcard =
      'https://en.wikipedia.org/wiki/File:English_pattern_2_of_spades.svg';

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
              return SizedBox(
                width: 25,
                height: 50,
                child: Card(
                  child: Image.asset(
                    'assets/backofcard.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
