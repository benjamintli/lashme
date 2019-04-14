import 'package:flutter/material.dart';

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

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPage createState() => _MyLoginPage();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
//    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.pink),
    PlaceholderWidget(Colors.blue)
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: new GlobalKey<ScaffoldState>(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kShrineBrown900
          ),
          centerTitle: true,
          title: Text("LashMe"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
            )
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
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
                  icon: Icon(Icons.calendar_today), title: Text("Appointments")),
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
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            // TODO: Wrap Password with AccentColorOverride (103)
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
                // TODO: Add a beveled rectangular border to CANCEL (103)
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
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
