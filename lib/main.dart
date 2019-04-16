import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:page_transition/page_transition.dart';


void main() => runApp(MyApp());

const kShrinePink50 = const Color(0xFFFEEAE6);
const kShrinePink100 = const Color(0xFFFEDBD0);
const kShrinePink300 = const Color(0xFFFBB8AC);
const kShrinePink400 = const Color(0xFFEAA4A4);
const kShrineBrown900 = const Color(0xFF442B2D);
const kShrineErrorRed = const Color(0xFFC5032B);
const kShrineSurfaceWhite = const Color(0xFFFFFBFA);
const kShrineBackgroundWhite = Colors.white;

final ThemeData _kShrineTheme = _buildShrineTheme();
double _offset = 0;

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _kShrineTheme,
      home: MyLoginPage(title: 'LashMe'),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class _cards extends State<lashFinder> {
  ScrollController _controller;

  void initState() {
    _controller = ScrollController(initialScrollOffset: _offset)
      ..addListener(() {
        setState(() {
          _offset = _controller.offset;
        });
      });
    super.initState();
  }

  static List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) => Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 11.0 / 11.0,
                  child: Image.asset(
                    'assets/images/kim-kardashian.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
//            Padding(
//              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text('Title'),
//                  SizedBox(height: 8.0),
//                  Text('Secondary Text'),
//                ],
//              ),
//            ),
              ],
            ),
          ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.search),
//            ),
            IconButton(
              icon: Icon(Icons.format_list_bulleted),
            ),
          ],
        ),
        new Expanded(child: GridView.count(
          controller: _controller,
          crossAxisCount: 2,
          padding: EdgeInsets.all(2.0),
          childAspectRatio: 9.0 / 9.0,
          // TODO: Build a grid of cards (102)
          children: _buildGridCards(10),
        )),
      ],
    );
  }
}

class _calendar extends State<calendarDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarCarousel(

      )
    );
  }
}

class calendarDisplay extends StatefulWidget {
  @override
  State createState() => _calendar();
}

class lashFinder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _cards();
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPage createState() => _MyLoginPage();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool flag = true;
  void onTabTapped(int index) {
    setState(() {
        _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    lashFinder(),
    PlaceholderWidget(Colors.deepOrange),
//    PlaceholderWidget(Colors.green),
    calendarDisplay(),
    PlaceholderWidget(Colors.blue)
  ];



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: new GlobalKey<ScaffoldState>(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: kShrineBrown900),
          centerTitle: true,
          title: Text("LashMe"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: _children[_currentIndex], // new
        bottomNavigationBar: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: new Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: new Text("Messages")),
//              BottomNavigationBarItem(
//                  icon: Icon(Icons.add_box), title: new Text("Add")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text("Appointments")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  //data: IconThemeData(color: Colors.grey.shade600)),
                  title: Text("Profile"))
            ]));
  }
}

class _MyLoginPage extends State<MyLoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
//                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('LashMe'),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
