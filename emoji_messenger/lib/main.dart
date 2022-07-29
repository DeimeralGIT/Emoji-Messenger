import 'package:emoji_messenger/keyToEmoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

late double screenHeight;
late double screenWidth;
late double textEmojiSide;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji_Messenger',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double initialSize;
  late double initialposition;
  bool isLanding = false;

  @override
  void initState() {
    initialSize = 40;
    initialposition = 0;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        initialSize = MediaQuery.of(context).size.width / 2.3;
        initialposition = (MediaQuery.of(context).size.height - MediaQuery.of(context).size.width / 1.5) / 2;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    textEmojiSide = screenWidth / 15;
    return Scaffold(
      backgroundColor: Colors.green,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: !isLanding
            ? Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    bottom: initialposition,
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.easeInOut,
                    onEnd: () => setState(() {
                      isLanding = true;
                    }),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: AnimatedSize(
                            duration: const Duration(milliseconds: 2000),
                            curve: Curves.easeInOut,
                            child: SvgPicture.asset(
                              'assets/emojis/1F44B.svg',
                              width: initialSize,
                              height: initialSize,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: AnimatedSize(
                            duration: const Duration(milliseconds: 2000),
                            curve: Curves.easeInOut,
                            child: KeyToEmoji("1F604.svg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: Transform(
                  transform: Matrix4.rotationZ(-0.5),
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: screenWidth / 2.5,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: KeyToEmoji("1F9D1"),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: KeyToEmoji("E147.svg"),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: KeyToEmoji("E267.svg"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
