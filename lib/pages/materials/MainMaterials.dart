import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

///

///

hideAppBar(double elev, context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(0),
    child: AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          //systemNavigationBarColor: Theme.of(context).primaryColor,
          ),
      elevation: elev,
    ),
  );
}

class BackgroundImageFb1 extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const BackgroundImageFb1(
      {required this.child, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class bottomNavigationBar1 extends StatefulWidget {
  const bottomNavigationBar1({super.key});

  @override
  bottomNavigationBar1State createState() => bottomNavigationBar1State();
}

class bottomNavigationBar1State extends State<bottomNavigationBar1> {
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
        itemCount: 4,
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
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}

final videos = [
  'assets/videos/Black_Coffee.mp4',
  'assets/videos/Water_3.mp4'
];

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoCard(
          assetPath: videos[index],
        );
      },
    );
  }
}

class VideoCard extends StatefulWidget {
  const VideoCard({
    super.key,
    required this.assetPath,
  });

  final String assetPath;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
    ..initialize().then((_) {
       setState(() {});
     })
    ..addListener(() => setState(() {}))
    ..setLooping(true)
    ..setVolume(0);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(vertical: 200, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}