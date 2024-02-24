import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/transaction.dart';
//import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String jsonData = '';
  List<Map<String, dynamic>> dataList = [
    {
      "id": 1,
      "name": " فرید احمد رحیمی",
      "serial": "۴۳۵۶۷",
      "account": "۶۵۷۸۶۷۵۸۴۳۲۴۵",
      "date": "۱۴۰۲-۱۱-۰۳",
      "money": "۲۳۰۰",
      "unit": "دالر",
      "state": "1",
    },
    {
      "id": 2,
      "name": " کریم رحیمی",
      "serial": "۴۳۵۶۷",
      "account": "۶۵۷۸۶۷۵۸۴۳۲۴۵",
      "date": "۱۴۰۲-۱۰-۰۳",
      "money": "۶۳۰۰",
      "unit": "افغانی",
      "state": "0",
    },
    {
      "id": 3,
      "name": "محمد رحیمی",
      "serial": "۴۳۵۶۷",
      "account": "۶۵۷۸۶۷۵۸۴۳۲۴۵",
      "date": "۱۴۰۲-۱۱-۰۳",
      "money": "۵۳۰۰",
      "unit": "دالر",
      "state": "1",
    },
    {
      "id": 4,
      "name": " شریف کریمی",
      "serial": "۴۳۵۶۷",
      "account": "۶۵۷۸۶۷۵۸۴۳۲۴۵",
      "date": "۱۴۰۲-۱۰-۰۹",
      "money": "۶۳۰۰",
      "unit": "کالدار",
      "state": "0",
    },
    {
      "id": 5,
      "name": " شریف کریمی",
      "serial": "۴۳۵۶۷",
      "account": "۶۵۷۸۶۷۵۸۴۳۲۴۵",
      "date": "۱۴۰۲-۱۰-۰۹",
      "money": "۶۳۰۰",
      "unit": "کالدار",
      "state": "1",
    },
    {
      "id": 6,
      "name": " شریف کریمی",
      "serial": "۴۳۵۶۷",
      "account": "۶۵۷۸۶۷۵۸۴۳۲۴۵",
      "date": "۱۴۰۲-۱۰-۰۹",
      "money": "۶۳۰۰",
      "unit": "کالدار",
      "state": "0",
    },
  ];



  @override
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );

  }

  late PageController _pageController;

  List<String> cardList = [
    "افغانی",
    "دالر",
    "تومان",
  ];

  int totalTransaction = 2;


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 136, 229, 1),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Badge(
                    backgroundColor: Colors.redAccent,
                    label: Text(
                      "7",
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()));
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/userimage.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: PageView.builder(
                      physics: const PageScrollPhysics(),
                      controller: _pageController,
                      itemCount: cardList.length,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Card(
                            color: Colors.blue,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cardList[index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 7),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        '۳۴۰۰',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 25),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 13,
                                            backgroundColor: Colors.white,
                                            // Color.fromARGB(255, 85, 145, 141),
                                            child: Icon(
                                              Icons.arrow_downward,
                                              color: Colors.black,
                                              size: 19,
                                            ),
                                          ),
                                          SizedBox(width: 7),
                                          Text(
                                            'برداشت',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 216, 216, 216),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 13,
                                            backgroundColor: Colors.white,
                                            // Color.fromARGB(255, 85, 145, 141),
                                            child: Icon(
                                              Icons.arrow_upward,
                                              color: Colors.black,
                                              size: 19,
                                            ),
                                          ),
                                          SizedBox(width: 7),
                                          Text(
                                            'واریز',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 216, 216, 216),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(25, 0, 30, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '۲۴۰۰',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '۵۴۰۰',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            //Center(
                            //   child: Text(
                            //     _cardList[index],
                            //     style: TextStyle(fontSize: 24.0),
                            //   ),
                            // ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    totalTransaction = 2;
                                  });
                                },
                                child: const Text(
                                  "آخرین تراکنش ها",
                                  style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromARGB(255, 83, 79, 79)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    totalTransaction = dataList.length;
                                  });
                                },
                                child: const Text(
                                  "همه",
                                  style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromARGB(255, 83, 79, 79)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 400, // Set the desired height
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: totalTransaction,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 70,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 244, 246, 248),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dataList[index]['name'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[800],
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                dataList[index]['account'],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                dataList[index]['serial'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                dataList[index]['date'],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.redAccent),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                dataList[index]['money'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                dataList[index]['unit'],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.redAccent),
                                              ),
                                            ],
                                          ),
                                          if (dataList[index]['state'] == "0")
                                            const Icon(
                                              Icons.arrow_upward,
                                              color: Colors.red,
                                              size: 19,
                                            )
                                          else
                                            const Icon(
                                              Icons.arrow_downward,
                                              color: Color.fromARGB(
                                                  255, 37, 235, 30),
                                              size: 19,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Transaction()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


