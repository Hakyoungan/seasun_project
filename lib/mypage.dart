import 'package:flutter/material.dart';
import 'package:hellonong/pharmacy.dart';
import 'package:hellonong/symptoms.dart';
import 'package:hellonong/widget/test.dart';
import 'bag.dart';
import 'home.dart';

class ListItemData {
  bool isSwitched;
  Color color;
  String date;

  ListItemData({
    required this.isSwitched,
    required this.color,
    required this.date,
  });
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<ListItemData> dateData = [
    ListItemData(isSwitched: false, color: Colors.white, date: "2023.07.13(목)"),
    ListItemData(isSwitched: false, color: Colors.white, date: "2023.07.12(수)"),
    ListItemData(isSwitched: false, color: Colors.white, date: "2023.07.10(월)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 40,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Bag()));
            },
            icon: Icon(
              Icons.list_alt_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
            },
            icon: Icon(
              Icons.person_outline,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dateData.length,
        itemBuilder: (context, index) {
          ListItemData listItemData = dateData[index];

          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${index + 1}. ${listItemData.date}", // 인덱스를 이용하여 1. 하고 날짜 표시
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    //여기서 토글 켜지는 부분이기 때문에 여기서 켜지면 알람 켜지도록 다시 설정해야함.
                    value: listItemData.isSwitched,
                    onChanged: (value) {
                      setState(() {
                        listItemData.isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          listItemData.color =
                              Theme.of(context).colorScheme.primaryContainer;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Symptoms(),
                          ),
                        ).then((value) {
                          setState(() {
                            listItemData.color = Colors.white;
                          });
                        });
                      },
                      child: Container(
                        height: 115,
                        width: 110,
                        child: Image.asset(
                          "assets/images/Frame 2608516.png",
                          width: 52,
                          height: 52,
                        ),
                        decoration: BoxDecoration(
                          color: listItemData.color,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 31),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          listItemData.color =
                              Theme.of(context).colorScheme.primaryContainer;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Pharmacy(isSelected1: [], isSelected2: [], isSelected3: [],),
                          ),
                        ).then((value) {
                          setState(() {
                            listItemData.color = Colors.white;
                          });
                        });
                      },
                      child: Container(
                        height: 115,
                        width: 110,
                        child: Image.asset(
                          "assets/images/Pharmacy.png",
                          width: 52,
                          height: 52,
                        ),
                        decoration: BoxDecoration(
                          color: listItemData.color,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
