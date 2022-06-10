import 'webportrait.dart';
import 'package:flutter/material.dart';
import 'package:highlowcardgame_pec01act7/responsive.dart';
import 'weblandscape.dart';
import 'instructions.dart';
import 'mobilelandscape.dart';
import 'mobileportrait.dart';

class Textbutton1 extends StatelessWidget {
  const Textbutton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Instructions()));
      },
      child: const Text(
        'Instructions',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }
}

class PlayScreen extends StatelessWidget {
  const PlayScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: ResponsiveWidget(
          mobile: PortraitORLandscape(),
          desktopportrait: MobileMode(),
          desktoplandscape: DesktopMode(),
        ),
      ),
      backgroundColor: Colors.pink[200],
    );
  }
}

class DesktopMod extends StatefulWidget {
  const DesktopMod({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopMod> createState() => _DesktopModState();
}

class _DesktopModState extends State<DesktopMod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundhome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(padding: EdgeInsets.all(200)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Textbutton1(),
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
    );
  }
}

class MobileMod extends StatelessWidget {
  const MobileMod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundhome.png'),
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
              child: Textbutton1(),
            ),
          ],
        ),
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundhome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(padding: EdgeInsets.all(50)),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton1(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.all(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PortraitORLandscape extends StatefulWidget {
  const PortraitORLandscape({Key? key}) : super(key: key);

  @override
  State<PortraitORLandscape> createState() => _PortraitORLandscapeState();
}

class _PortraitORLandscapeState extends State<PortraitORLandscape> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => orientation == Orientation.portrait
          ? buildPortrait()
          : buildLandscape(),
    );
  }

  Widget buildPortrait() => const Scaffold(
        body: MobilePortrait(),
      );

  Widget buildLandscape() => const Scaffold(
        body: MobileLandscape(),
      );
}

class Flipcard extends StatefulWidget {
  final String imgpath;
  const Flipcard({required Key key, required this.imgpath}) : super(key: key);

  @override
  State<Flipcard> createState() => _FlipcardState();
}

class _FlipcardState extends State<Flipcard> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imgpath,
      key: ValueKey<String>(widget.imgpath),
      height: 250,
      width: 175,
      fit: BoxFit.fill,
    );
  }
}

class FlipcardMobile extends StatefulWidget {
  const FlipcardMobile({Key? key, required this.imagpath}) : super(key: key);
  final String imagpath;

  @override
  State<FlipcardMobile> createState() => _FlipcardMobileState();
}

class _FlipcardMobileState extends State<FlipcardMobile> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagpath,
      key: ValueKey<String>(widget.imagpath),
      height: 100,
      width: 50,
      fit: BoxFit.fill,
    );
  }
}

class FlipcardMobileLandscape extends StatefulWidget {
  const FlipcardMobileLandscape({Key? key, required this.imagpath})
      : super(key: key);
  final String imagpath;

  @override
  State<FlipcardMobileLandscape> createState() =>
      _FlipcardMobileLandscapeState();
}

class _FlipcardMobileLandscapeState extends State<FlipcardMobileLandscape> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagpath,
      key: ValueKey<String>(widget.imagpath),
      height: 240,
      width: 180,
      fit: BoxFit.fill,
    );
  }
}
