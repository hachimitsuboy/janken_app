import 'package:flutter/material.dart';
import 'dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _imageWidget = Image.asset("assets/images/hatena.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("じゃんけんアプリ"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _imageWidget,
          Row(
            children: [
              Expanded(flex: 1, child: _selectButton("rock.png", 1)),
              Expanded(flex: 1, child: _selectButton("scissors.png", 2)),
              Expanded(flex: 1, child: _selectButton("paper.png", 3)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _selectButton(String selectHand, int selectNumber) {
    print(selectHand);

    late Widget _jankenButton;

    _jankenButton = SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () => _onClick(selectNumber),
        child: Image.asset("assets/images/$selectHand"),
        // child: Text(selectHand),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );

    return _jankenButton;
  }

  _onClick(int selectNumber) {
    //setStateメソッドを呼び出して、新しい描画

    print("押されたよ！");
  }
}
