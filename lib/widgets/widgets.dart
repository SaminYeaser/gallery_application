import 'package:flutter/material.dart';

Widget AppName() {
  return Row(
    children: <Widget>[
      Text('Wallpaper',
      style: TextStyle(
        fontFamily: 'MrDafoe',
        fontSize: 30
      )
        ),
      Container(
        child: GradientText(),
      )
    ],
  );
}
class GradientText extends StatefulWidget {
  const GradientText({
    Key key,
  }): super(key:key);
  @override
  _GradientTextState createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    _animationController = AnimationController(vsync:this,duration: Duration(milliseconds: 2000));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: Text(
        'Zone',
        style: TextStyle(
            color: Colors.white,
          fontFamily: 'Bangers'
        ),
      ),
      shaderCallback: (rect){
        return LinearGradient(
          stops: [_animation.value - 0.5, _animation.value],
          colors: [
            Color(int.parse('0xFFde6262 ')),
            Color(int.parse('0xFFffb88c'))]
        ).createShader(rect);
      },);
  }
}
