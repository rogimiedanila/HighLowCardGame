import 'package:flutter/material.dart';
import 'package:highlowcardgame_pec01act7/home.dart';
import 'package:highlowcardgame_pec01act7/responsive.dart';
import 'package:highlowcardgame_pec01act7/statelesswidget.dart';

class Textbutton4 extends StatelessWidget {
  const Textbutton4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage(
                      title: 'High Low Card Game',
                    )));
      },
      child: const Text(
        'Exit',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }
}

class Textbutton3 extends StatelessWidget {
  const Textbutton3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PlayScreen()));
      },
      child: const Text(
        'Try Again',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }
}

class GameOver extends StatefulWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ResponsiveWidget(
      mobile: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundgameover.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(padding: EdgeInsets.all(50)),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton4(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton3(),
            ),
          ],
        ),
      ),
      desktopportrait: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundgameover.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(padding: EdgeInsets.all(5)),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton4(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton3(),
            ),
          ],
        ),
      ),
      desktoplandscape: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundgameover.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(padding: EdgeInsets.all(200)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Textbutton4(),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Textbutton3(),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
