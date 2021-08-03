import 'package:flutter/material.dart';
import 'dart:math' as Math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _imageWidget = Image.asset("assets/images/hatena.png");
  String _textHeader = "出す手を選択してください";

  late Widget _selectButton1 = _selectButton("rock.png", 1);
  late Widget _selectButton2 = _selectButton("scissors.png", 2);
  late Widget _selectButton3 = _selectButton("paper.png", 3);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("じゃんけんアプリ"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            _textHeader,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          _imageWidget,
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Visibility(
                    child: _selectButton1,
                    visible: true,
                  )),
              Expanded(
                  flex: 1,
                  child: Visibility(
                    child: _selectButton2,
                    visible: true,
                  )),
              Expanded(
                  flex: 1,
                  child: Visibility(
                    child: _selectButton3,
                    visible: true,
                  )),
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
    //1:グー,2:チョキ,3:パー

    var _rand = new Math.Random();
    var _randInt = _rand.nextInt(3) + 1;
    var _judgeString = _judge(_randInt, selectNumber);

    print("CPUの手$_randInt");
    print("選択した手:$selectNumber");
    print(_judgeString);

    _resultView(_judgeString, selectNumber);
  }

  String _judge(int randInt, int selectNumber) {
    late String _judgeString;

    if (((selectNumber == 1) && (randInt == 2)) ||
        ((selectNumber == 2) && (randInt == 3)) ||
        ((selectNumber == 3) && (randInt == 1))) {
      _judgeString = "勝利！おめでとう！";
    } else if (((selectNumber == 1) && (randInt == 3)) ||
        ((selectNumber == 2) && (randInt == 1)) ||
        ((selectNumber == 3) && (randInt == 2))) {
      _judgeString = "敗北！残念。。";
    } else {
      _judgeString = "引き分け！";
    }

    return _judgeString;
  }

  void _resultView(String _judgeString, int selectNumber) {
    setState(() {
      if (selectNumber == 1) {
        _imageWidget = Image.asset("assets/images/rock.png");
      } else if (selectNumber == 2) {
        _imageWidget = Image.asset("assets/images/scissors.png");
      } else {
        _imageWidget = Image.asset("assets/images/paper.png");
      }

      _textHeader = _judgeString;

      _selectButton1 = Container();
      _selectButton2 = Container();
      _selectButton3 = Container();

    });
  }
}
