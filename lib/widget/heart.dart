
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;



  @override
  void initState() {

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    super.initState();

    _colorAnimation = ColorTween(begin: Colors.grey ,end: Colors.red)
    .animate(_controller);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem>[
        TweenSequenceItem(
            tween: (Tween(begin: 30.0,end : 50.0)),
            weight: 50
        ),
        TweenSequenceItem(
            tween: (Tween(begin: 50.0,end : 30.0)),
            weight: 50
        ),
      ]
    ).animate(_controller);


    _controller.addListener(() {
      print(_controller.value);
    });

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState((){
          isFav = true;
        });
      }
      if(status == AnimationStatus.dismissed){
        setState((){
          isFav = false;
        });
      }
    });


  }

  // dismiss the animation when widget exits screen
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _){
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
           isFav ? _controller.reverse() : _controller.forward();
          },
        );
      }

    );

  }
}