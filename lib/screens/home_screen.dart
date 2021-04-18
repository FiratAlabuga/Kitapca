import 'package:flutter/material.dart';
import 'package:hackathon_social/screens/profile_screen.dart';
import 'package:hackathon_social/screens/donate_book.dart';
import 'package:hackathon_social/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'book_feed.dart';
import 'login_screen.dart';
import 'my_chats.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthMethods authMethods = new AuthMethods();

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    MyChats(),
    BuyBooks(),
    SellBooks(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Color(0xFF12867E),
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Icon(
              Icons.menu_book_sharp,
              size: 35.0,
            ),
          ),
          titleSpacing: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              'Kitapça',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () async {
                try {
                  await authMethods.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false);
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0, right: 16.0),
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon:
                    FaIcon(FontAwesomeIcons.facebookMessenger, color: Colors.purple[800]),
                icon: FaIcon(FontAwesomeIcons.facebookMessenger, color: Colors.grey[600]),
                label: "Mesajlar"
                ),
            BottomNavigationBarItem(
                activeIcon:
                    FaIcon(FontAwesomeIcons.bookOpen, color: Colors.purple[800]),
                icon: FaIcon(FontAwesomeIcons.bookReader, color: Colors.grey[600]),
                label: "Kitaplar"
                ),
            BottomNavigationBarItem(
                activeIcon: FaIcon(
                  FontAwesomeIcons.share,
                  color: Colors.purple[800],
                ),
                icon: FaIcon(
                  FontAwesomeIcons.share,
                  color: Colors.grey[600],
                ),
                label: "Bağışla"
                ),
            BottomNavigationBarItem(
                activeIcon: Icon(FontAwesomeIcons.userCircle, color: Colors.purple[800]),
                icon: Icon(FontAwesomeIcons.user, color: Colors.grey[600]),
                label: "Profil"
                ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Color(0xFF000000),
        unselectedItemColor: Colors.black54,
        unselectedFontSize: 14.0,
        selectedFontSize: 14.0,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
