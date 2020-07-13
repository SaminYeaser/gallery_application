import 'package:flutter/material.dart';

Widget AppName() {
  return Row(
    children: <Widget>[
      Text('Wallpaper'),
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
            color: Colors.white
        ),
      ),
      shaderCallback: (rect){
        return LinearGradient(
          stops: [_animation.value - 0.5, _animation.value],
          colors: [
            Color(int.parse('0xFF00C9FF')),
            Color(int.parse('0xFF92FE9D'))]
        ).createShader(rect);
      },);
  }
}
