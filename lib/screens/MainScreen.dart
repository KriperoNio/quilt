import 'package:flutter/material.dart';
import 'package:quilt/pages/navigation_bar_tabs/MainPage.dart';
import '../pages/navigation_bar_tabs/PageSearch.dart';
import '../pages/navigation_bar_tabs/PageSettings.dart';
import '../pages/navigation_bar_tabs/PageStatus.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainScrollBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: const Material(
              color: Colors.transparent,
              child: Center(
                child: NavigationBarMain(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MainScrollBar extends StatelessWidget {
  const MainScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [MainPage(), PageSearch(), PageSettings(), PageStatus()],
    );
  }
}

class NavigationBarMain extends StatefulWidget {
  const NavigationBarMain({super.key});

  @override
  NavigationBarMainState createState() => NavigationBarMainState();
}

class NavigationBarMainState extends State<NavigationBarMain> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(20),
      height: size.width * .155,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0.199),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: listOfIcons.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  bottom: index == currentIndex ? 0 : size.width * .029,
                  right: size.width * .0422,
                  left: size.width * .0422,
                ),
                width: size.width * .128,
                height: index == currentIndex ? size.width * .014 : 0,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
              Icon(
                listOfIcons[index],
                size: size.width * .076,
                color: index == currentIndex
                    ? Colors.green
                    : Colors.greenAccent[200],
              ),
              SizedBox(height: size.width * .03),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.video_camera_back_outlined,
    Icons.settings_rounded,
    Icons.settings_rounded,
  ];
}
