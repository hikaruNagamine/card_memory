import 'package:card_memory/components/importer.dart';

class GamePage extends StatelessWidget {
  final bool clickedCentreFAB;

  GamePage({@required this.clickedCentreFAB});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: clickedCentreFAB ? MediaQuery.of(context).size.height : 0.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: null, color: Colors.cyan),
        child: _GamePlayView(),
      ),
    );
  }
}

class _GamePlayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    // TODO : ゲームのプレイ画面を作成。カウントダウン部分とカード部分で２つにする。
    // TODO : カウントダウンタイマーはCommonにすること。
    // TODO : カードの部分は別ファイルでクラス化。
    return Text(
      "animation game page " + counter.fabIconNumber.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
