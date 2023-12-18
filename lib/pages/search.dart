import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jitak_non_getex/pages/stamp_card.dart';
import 'package:jitak_non_getex/widgets/custom_snackbar.dart';
import 'package:svg_flutter/svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting('ja_JP');
  }

  @override
  Widget build(BuildContext context) {
    var gap = SizedBox(
      height: MediaQuery.of(context).size.height * 0.028,
    );
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Center(
                child: Text(
              '北海道, 札幌市',
              style: TextStyle(fontSize: 18),
            ))),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  customSnackbar(context, '近日公開...');
                },
                child: SvgPicture.asset('assets/Filter_icon.svg')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  customSnackbar(context, '近日公開...');
                },
                child: SvgPicture.asset('assets/Vector.svg')),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffFAAA14), Color(0xffFFD78D)])),
              child: const Center(
                  child: Text(
                '2022年 5月 26日（木）',
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
            ),
            gap,
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.9,
            //   height: MediaQuery.of(context).size.height * 0.1,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               currentIndex = index;
            //             });
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 color: currentIndex == index
            //                     ? const Color(0xffFAAA14)
            //                     : const Color(0xffFAFAFA),
            //                 borderRadius: BorderRadius.circular(10)),
            //             // height: MediaQuery.of(context).size.height * 0.01,
            //             width: MediaQuery.of(context).size.width * 0.11,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   '木',
            //                   style: TextStyle(
            //                       color: currentIndex == index
            //                           ? const Color(0xffffffff)
            //                           : const Color(0xff303030),
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold,
            //                       fontFamily: 'Noto Sans JP'),
            //                 ),
            //                 Text(
            //                   '26',
            //                   style: TextStyle(
            //                       color: currentIndex == index
            //                           ? const Color(0xffffffff)
            //                           : const Color(0xff303030),
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // Calculate the date for the current index
                  DateTime currentDate =
                      DateTime.now().add(Duration(days: index));

                  // Format the weekday and date in Japanese
                  String formattedWeekday =
                      DateFormat.E('ja_JP').format(currentDate);
                  String formattedDate =
                      DateFormat.d('ja_JP').format(currentDate).substring(0, 2);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? const Color(0xffFAAA14)
                              : const Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width * 0.11,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              formattedWeekday,
                              style: TextStyle(
                                color: currentIndex == index
                                    ? const Color(0xffffffff)
                                    : const Color(0xff303030),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Noto Sans JP',
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                color: currentIndex == index
                                    ? const Color(0xffffffff)
                                    : const Color(0xff303030),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            gap,
            Expanded(
              flex: 0,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const StampCard(),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.52,
                              width: double.infinity,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  // color: const Color.fromARGB(255, 123, 20, 20),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.24,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: Colors.amber,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/happy.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                    gap,
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: const Text(
                                          '介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）'),
                                    ),
                                    gap,
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              child: const Center(
                                                  child: Text(
                                                '介護付き有料老人ホーム',
                                                style: TextStyle(
                                                    color: Color(0xffFAAA14)),
                                              )),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              child: const Text(
                                                '¥ 6,000',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    gap,
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: const Row(
                                          children: [
                                            Text('5月 31日（水）08 : 00 ~ 17 : 00'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: const Row(
                                          children: [
                                            Text('北海道札幌市東雲町3丁目916番地17号'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: const Row(
                                          children: [
                                            Text('交通費 300円'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '住宅型有料老人ホームひまわり倶楽部',
                                              style: TextStyle(
                                                  color: Color(0xff30303059)),
                                            ),
                                            SvgPicture.asset(
                                              'assets/Vector.svg',
                                              color: const Color(0xff30303059),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.19,
                          left: 0,
                          child: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                color: const Color(0xffFF6262),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                                child: Text(
                              '本日まで',
                              style: TextStyle(color: Color(0xffFFFFFF)),
                            )),
                          ),
                        ),
                      ],
                    ),
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
