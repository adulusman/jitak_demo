import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:jitak_non_getex/pages/buisness.dart';
import 'package:jitak_non_getex/pages/chat.dart';
import 'package:jitak_non_getex/pages/profile.dart';
import 'package:jitak_non_getex/pages/search.dart';
import 'package:svg_flutter/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const SearchPage(),
    const Buisness(),
    // const SacnnerPage(),
    const Chat(),
    const Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const SearchPage();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String barcode = 'Tap  to scan';
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: const Color(0xffFAAA14),
        shape: const CircleBorder(),
        backgroundColor: const MaterialColor(0xffFFD78D,
            <int, Color>{100: Color(0xffFAAA14), 50: Color(0xffEDA827)}),
        onPressed: () {
          setState(() async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AiBarcodeScanner(
                  validator: (value) {
                    return value.startsWith('https://');
                  },
                  canPop: false,
                  onScan: (String value) {
                    debugPrint(value);
                    setState(() {
                      barcode = value;
                    });
                  },
                  onDetect: (p0) {},
                  onDispose: () {
                    debugPrint("Barcode scanner disposed!");
                  },
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.noDuplicates,
                  ),
                ),
              ),
            );
            // currentScreen = const SacnnerPage();
            // currentTab = 3;
          });
        },
        child: SvgPicture.asset('assets/scan-line.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 86,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const SearchPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/search.svg',
                          color: currentTab == 0
                              ? const Color(0xffFAAA14)
                              : Colors.blueGrey,
                        ),
                        Text(
                          'さがす',
                          style: TextStyle(
                            color: currentTab == 0
                                ? const Color(0xffFAAA14)
                                : Colors.blueGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const Buisness();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/office bag.svg',
                          color: currentTab == 1
                              ? const Color(0xffFAAA14)
                              : Colors.blueGrey,
                        ),
                        Text(
                          'お仕事',
                          style: TextStyle(
                            color: currentTab == 1
                                ? const Color(0xffFAAA14)
                                : Colors.blueGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '打刻する',
                        style: TextStyle(
                          color: currentTab == 3
                              ? const Color(0xffFAAA14)
                              : Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const Chat();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/typing.svg',
                          color: currentTab == 4
                              ? const Color(0xffFAAA14)
                              : Colors.blueGrey,
                        ),
                        Text(
                          'チャット',
                          style: TextStyle(
                            color: currentTab == 4
                                ? const Color(0xffFAAA14)
                                : Colors.blueGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const Profile();
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/account.svg',
                          color: currentTab == 5
                              ? const Color(0xffFAAA14)
                              : Colors.blueGrey,
                        ),
                        Text(
                          'マイページ',
                          style: TextStyle(
                            color: currentTab == 5
                                ? const Color(0xffFAAA14)
                                : Colors.blueGrey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
