import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';

import 'home.dart';
import 'main.dart';
import 'mypage.dart';
import 'bag.dart';

class  leftArm extends StatefulWidget {
  const leftArm ({super.key});


  @override
  State<leftArm> createState() => _leftArmState();
}

class _leftArmState extends State<leftArm> {
  Test test = Test(1);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Bag() //page 간 이동
                ));},
              icon:Icon(
                Icons.list_alt_rounded,
                size: 40,
                color: Colors.white,
              )
          ),
          IconButton(
              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => MyPage()));},
              icon:Icon(
                Icons.person_outline,
                size: 40,
                color: Colors.white,
              )
          )
        ],
      ),
      body:
      Align(
        alignment: Alignment.center, // 가운데 정렬
        child: Container(
          //왼쪽 팔
          height: screenHeight * 0.75,
          width: screenWidth * 0.9,
          margin: EdgeInsets.only(top: screenHeight * 0.01),
          child: Stack(
            children: [
              // 사진을 가장 먼저 추가
              Container(
                width: screenWidth * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/leftArm1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //어깨
              Positioned(
                bottom: screenHeight * 0.555,
                left: screenWidth * 0.55,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Container(
                  width: screenWidth * 0.33,
                  height: screenHeight * 0.13,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(102, 102, 102, 1.0),
                      width: 1.0,
                    ),
                    ),
                  ),
                ),
              ),
              // 팔위
              Positioned(
                bottom: screenHeight * 0.345,
                left: screenWidth * 0.32,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Transform.rotate(
                  angle: -1.1,
                  child: Container(
                  width: screenWidth * 0.45,
                  height: screenHeight * 0.17,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(102, 102, 102, 1.0),
                      width: 1.0,
                    ),
                    ),
                  ),
                ),
              ),
              ),
              // 팔밑
              Positioned(
                bottom: screenHeight * 0.15,
                left: screenWidth * 0.15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Transform.rotate(
                  angle: -1.1, // 회전 각도 (라디안 단위, 여기서는 -0.5 라디안 = -28.65도)
                  child: Container(
                    width: screenWidth * 0.39,
                    height: screenHeight * 0.17,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromRGBO(102, 102, 102, 1.0),
                        width: 1.0,
                      ),
                      ),
                    ),
                  ),
                ),
              ),

              // 손
              Positioned(
                bottom: screenHeight * 0.01,
                left: screenWidth * 0.02,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Container(
                  width: screenWidth * 0.27,
                  height: screenHeight * 0.13,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(102, 102, 102, 1.0),
                      width: 1.0,
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: test.bottmNavi(context),
    );
  }
}
