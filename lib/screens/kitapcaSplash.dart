import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// This is combination of three carousel screens which change the next button to finish on last screen.
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variable string for changing the text
  String snackBarText = "";
  String imageLoc = "assets/Screen-02.png";

  // variable for carousel dots
  int _current = 0;

  // List of Titles
  static List<String> imgList = [
    "Chose your Category",
    "Select the book",
    "Start reading Dude!"
  ];

  // List of Widgets formed with above titles
  final List<Widget> imageSlider = imgList.map((item) => texter(item)).toList();

  // For controlling the carousel
  final CarouselController _controller = CarouselController();

  // Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Backgroung image
          Image(
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            image: AssetImage(imageLoc),
          ),

          // Column having other widgets(buttons, text and, containers)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: CarouselSlider(
                  carouselController: _controller,
                  items: imageSlider,
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _current = index;
                            switch (_current) {
                              case 0:
                                imageLoc = "assets/Screen-02.png";
                                break;
                              case 1:
                                imageLoc = "assets/Screen-03.png";
                                break;
                              case 2:
                                imageLoc = "assets/Screen-04 (1).png";
                                break;
                              default:
                                imageLoc = "assets/Screen-02.png";
                                break;
                            }
                          },
                        );
                      },
                      enableInfiniteScroll: false,
                      reverse: false,
                      viewportFraction: 1,
                      height: 130),
                ),
              ),
              SizedBox(height: 0),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // skip button
                    GestureDetector(
                      onTap: () => _controller.jumpToPage(2),
                      child: Container(
                        height: 45,
                        width: 100,
                        color: Colors.white30,
                        child: Center(
                            child: Text("SKIP",
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black))),
                      ),
                    ),

                    // Dots
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Row(
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return _current == index
                              ? Padding(
                                  padding: EdgeInsets.only(right: 22),
                                  child: Container(
                                    height: 11,
                                    width: 11,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green.shade300),
                                  ))
                              : Padding(
                                  padding: EdgeInsets.only(right: 22),
                                  child: Container(
                                    height: 8,
                                    width: 8,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                  ),
                                );
                        }).toList(),
                      ),
                    ),

                    // Changing state of NEXT button with FINISH
                    _current == 2
                        ? GestureDetector(
                            onTap: () {
                              _controller.nextPage();
                              // showAlertDialog(context);
                            },
                            child: Container(
                              height: 45,
                              width: 100,
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: Colors.purple[800], width: 1)
                                  ),
                              child: Center(
                                  child: Text("FINISH",
                                      style: TextStyle(
                                        letterSpacing: 0.5,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green.shade300,
                                      ))),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage();
                            },
                            child: Container(
                              height: 45,
                              width: 100,
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: Colors.purple[800], width: 1)
                                  ),
                              child: Center(
                                child: Text(
                                  "NEXT",
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green.shade300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
  }

  // Widget for displaying the text on the screen.
  static Widget texter(String heading) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 36, right: 36),
                child: Text(
                  heading,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 36, left: 36),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "The first mate and his Skipper too will done their very comfortable in their belt total island nest to till the end. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}