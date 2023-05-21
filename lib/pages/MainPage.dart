import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'materials/MainMaterials.dart';

class MainPage extends StatelessWidget {
  const MainPage ({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Stack(
      children: [
        Image(
          image: const NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/backgrounds%2Fyusuf-evli-bVq6bh26H-Y-unsplash.jpg?alt=media&token=770e26c4-a42a-4675-b978-5c34226a04fb"),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: bottomNavigationBar1(),
          body: VideosScreen(),
        ),
      ]
    );
  }
}
