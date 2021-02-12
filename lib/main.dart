import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static final colorTween = ColorTween(begin: Colors.white, end: Colors.orange);
  double _valorAdp = 0;
  Color _novaCor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Center(
              child: TweenAnimationBuilder(
                  tween: ColorTween(begin: Colors.white, end: _novaCor),
                  duration: Duration(seconds: 3),
                  builder: (_,Color color, __){
                    return ColorFiltered(
                        child: Image.asset('imagens/sun.png'),
                        colorFilter: ColorFilter.mode(color, BlendMode.modulate)
                    );
                  }
              ),
            ),
            Slider.adaptive(
                value: _valorAdp,
                onChanged: (double valor){
                  setState(() {
                    _valorAdp = valor;
                    _novaCor = Color.lerp(Colors.white, Colors.red, _valorAdp);
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}
