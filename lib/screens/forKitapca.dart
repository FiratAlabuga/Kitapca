import 'package:flutter/material.dart';
import 'package:hackathon_social/screens/kitapcaSplash.dart';
import 'package:hackathon_social/screens/login_screen.dart';
import 'package:hackathon_social/screens/register.dart';

class ForKitapca extends StatefulWidget {
  @override
  _ForKitapcaState createState() => _ForKitapcaState();
}

class _ForKitapcaState extends State<ForKitapca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.green.shade200,
                Colors.green.shade700,
              ], begin: Alignment.topLeft, end: Alignment.bottomCenter)),
            ),
            Container(
              child: Center(
                child: Image(
                  image: NetworkImage(
                      "https://res.cloudinary.com/harshkumarkhatri/image/upload/v1597665430/profile_pictures/Screen-01_1_yqnjtn.png"),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) => SplashScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            "Uygulama Hakkında Bir Tur",
                            style: TextStyle(
                                letterSpacing: .8,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2 - 28,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 1.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                    letterSpacing: -.3,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) => Register(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2 - 28,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 1.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "Kayıt Ol",
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}