import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitak_non_getex/pages/edit_store.dart';
import 'package:svg_flutter/svg.dart';

class StampCard extends StatefulWidget {
  const StampCard({super.key});

  @override
  State<StampCard> createState() => _StampCardState();
}

int currentCardIndex = 1;
PageController _pageController = PageController();

class _StampCardState extends State<StampCard> {
  @override
  Widget build(BuildContext context) {
    var gap = SizedBox(
      height: MediaQuery.of(context).size.height * 0.028,
    );
    return Scaffold(
      backgroundColor: const Color(0xffA8B1FF),
      appBar: AppBar(
        backgroundColor: const Color(0xffA8B1FF),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              backgroundColor: Color(0xff949EFF),
              child: Icon(
                CupertinoIcons.back,
                size: 18,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
        ),
        title: const Text(
          'スタンプカード詳細',
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const EditStore(),
                    ));
              },
              child: SvgPicture.asset(
                'assets/minus-circle.svg',
                height: 30,
              )),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mer キッチン',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xffFFFFFF)),
                  ),
                  SizedBox(
                      child: Row(
                    children: [
                      Text(
                        '現在の獲得数',
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '30',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '個',
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            gap,
            Container(
              height: MediaQuery.of(context).size.height * 0.38,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.26,
                            width: MediaQuery.of(context).size.width * 0.84,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(1, 3),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                              ),
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/Star 8.svg',
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          currentCardIndex = index + 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: Text('$currentCardIndex / 2枚目'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ListTile(
                    tileColor: Colors.white,
                    title: Text(
                      'スタンプ獲得履歴',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2021 / 11 / 18',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'スタンプを獲得しました。',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    trailing: Text('1 個',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
