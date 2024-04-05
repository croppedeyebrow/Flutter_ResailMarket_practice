import 'package:flutter/material.dart';

class ManorTemperature extends StatelessWidget {
  double manorTemp;
  int level = 0;
  final List<Color> tempColors = [
    Color(0xff072038),
    Color(0xff0d3a65),
    Color(0xff186ec0),
    Color(0xff37b24d),
    Color(0xffffad13),
    Color(0xfff76707)
  ];

  ManorTemperature({Key? key, this.manorTemp = 0.0}) : super(key: key) {
    _calcTempLevel();
  }

  void _calcTempLevel() {
    // 온도에 따른 레벨 계산
    if (manorTemp <= 20.0) {
      level = 0;
    } else if (manorTemp > 20 && manorTemp <= 32) {
      level = 1;
    } else if (manorTemp > 32 && manorTemp <= 36.5) {
      level = 2;
    } else if (manorTemp > 36.5 && manorTemp <= 40) {
      level = 3;
    } else if (manorTemp > 40 && manorTemp <= 50) {
      level = 4;
    } else if (manorTemp > 50) {
      level = 5;
    }
  }

  Widget _makeTemPLabelAndBar() {
    return Container(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 매너온도 레벨 텍스트
          Text(
            "${manorTemp}°C",
            style: TextStyle(
                color: tempColors[level],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          // 매너온도 레벨 바
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: 8,
              color: Colors.blue.withOpacity(0.2),
              //레벨 바의 길이를 매너온도에 따라 계산
              //자식으로 레벨 바를 채울 레벨바를 만들어줍니다.
              child: Row(children: [
                Container(
                  height: 6,
                  width:
                      60 / 99 * manorTemp, // 60은 Container의 width, 99는 매너온도 최대치
                  // 60을 99로 나눈 값에 매너온도를 곱해주면 매너온도에 따른 막대의 길이를 구할 수 있습니다.
                  color: tempColors[level],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _makeTemPLabelAndBar(),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: 30,
              height: 30,
              child: Image.asset("assets/images/level-${level}.jpg"),
            )
          ],
        ),
        Text("매너온도",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 10,
                color: Colors.blueGrey)),
      ]),
    );
  }
}
