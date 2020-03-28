import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Splash extends StatefulWidget {
  Splash({String title});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  title: 'Login',
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Image.asset('assets/images/logo.png'),
              width: 150,
              height: 150,
            ),
            SizedBox(
              child: Image.asset('assets/images/title.png'),
              width: 200,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

//Login page----//
class LoginPage extends StatelessWidget {
  LoginPage({String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Log In',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                'Login using your email and password',
                style: TextStyle(fontSize: 18, color: Color(0xffCBCBCB)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      enabled: true,
                      fillColor: Color(0xff4D4D4D),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Color(0xff707070), width: 0.1)),
                      hintText: 'Enter Email ID'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      filled: true,
                      enabled: true,
                      fillColor: Color(0xff4D4D4D),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Color(0xff707070), width: 0.1)),
                      hintText: 'Enter Password'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.signInAlt),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LandingPage(
                        title: 'Login',
                      )),
            );
          }),
    );
  }
}

//Home page----//

class LandingPage extends StatefulWidget {
  LandingPage({String title});

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Courses',
    ),
    Text(
      'Index 2: Help',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.graduationCap),
            title: Text('Courses'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

//----Home Page for tab ---///
class HomePage extends StatelessWidget {
  var coaches = [
    {'img': '', 'name': 'Sid 1', 'deg': 'Android'},
    {'img': '', 'name': 'Sid 2', 'deg': 'PHP'}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
          title: Text(
            'Siddhartha Maji',
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'siddhartha.ee.13@gmail.com',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          trailing: Icon(Icons.settings),
        ),
        Spacer(flex: 4,),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'Top Coaches',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100, // constrain height
                  child: ListView(
                    shrinkWrap: true, // use it
                    scrollDirection: Axis.horizontal,
                    children: coaches.map((itm) => CoachCell(itm)).toList(),
                  ),
                ),
              )
            ],
          ),
        ),

                Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left:5,right: 5,top: 20,bottom: 5),
                child: Text(
                  'Top Courses',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox( // constrain height
                  child: ListView(
                    shrinkWrap: true, // use it
                    scrollDirection: Axis.vertical,
                    children: coaches.map((itm) => CourseCell(itm)).toList(),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


 class CoachCell extends StatelessWidget {
   CoachCell(this.itm);
  final Map<String, String> itm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 180.0,
        child: ListTile(leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
                    title: Text(itm['name']),
                    subtitle: Text('sid@gmail.com'),),
      ),
  ),
    );
  }
}

class CourseCell extends StatelessWidget {
   CourseCell(this.itm);
  final Map<String, String> itm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 5),
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(5),
      child: Container(
        width: 180.0,
        child: ListTile(
                    title: Text(itm['name']),
                    subtitle: Text('sid@gmail.com'),),
      ),
  ),
    );
  }
}

