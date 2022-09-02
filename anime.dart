// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this,duration: Duration(seconds: 5),
  )..repeat(reverse: false);
  late Animation<Offset> _animation  = Tween(
    begin: Offset(-1.5,0),
    end: Offset(2.2,0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn)
  );

  @override
  void initState() {
    super.initState();
    repeatOnce();
  }

  void repeatOnce() async {
    await _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[

    Center(
    child: Padding(
    padding: EdgeInsets.fromLTRB(40,10,40,0),
    child: Center(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    decoration: BoxDecoration(color: Colors.transparent),
    height: 200.0,
    width: 360.0,
    child: Center(
    child: SizedBox(
    width: 250.0,
    child: DefaultTextStyle(
    style: const TextStyle(
    fontSize: 30.0,
    fontFamily: 'popin',
      fontWeight: FontWeight.bold,
        color: Colors.greenAccent

    ),
    child: AnimatedTextKit(
    isRepeatingAnimation: false,
    animatedTexts: [
    TyperAnimatedText('FORMULA ONE HOSTEL BOOKING'
    ,speed: Duration(milliseconds: 120)),

    ]
    ),
    ),
    ),
    ),
    )
    ]
    )
    )
    )
    ),
        SlideTransition(
          position: _animation,
          child: Image.asset('assets/pngegg.png',
            scale: 2,),
        ),
    ]);
  }
}
