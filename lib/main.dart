import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_provider/viewmodels/topstories.dart';
import 'package:flutter_news_provider/views/artspage.dart';
import 'package:flutter_news_provider/views/homepage.dart';
import 'package:flutter_news_provider/views/sciencepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TopStoriesProvider>(
            create: (_) => TopStoriesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedpage = 0; //initial value

  final _pageOptions = [
    HomePage(),
    ArtsPage(),
    SciencePage()
  ]; // listing of all 3 pages index wise

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[
          selectedpage], // initial value is 0 so HomePage will be shown
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        buttonBackgroundColor: Colors.orange,
        backgroundColor: Colors.white,
        color: Colors.orange,
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.color_lens,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.science,
            size: 30,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          setState(() {
            selectedpage =
                index; // changing selected page as per bar index selected by the user
          });
        },
      ),
    );
  }
}
