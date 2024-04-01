import 'package:flutter/material.dart';

// StatefulWidget을 상속받는 ResailHome 클래스 선언
class ResailHome extends StatefulWidget {
  // 생성자에서 key를 optional로 받음
  ResailHome({Key? key}) : super(key: key);

  // createState 메서드를 오버라이드하여 _ResailHomeState 인스턴스를 반환
  @override
  _ResailHomeState createState() => _ResailHomeState();
}

// State를 상속받는 _ResailHomeState 클래스 선언
class _ResailHomeState extends State<ResailHome> {
  // build 메서드를 오버라이드하여 UI를 그림
  @override
  Widget build(BuildContext context) {
    // Scaffold 위젯을 반환하여 기본 레이아웃을 제공
    return Scaffold(
      // AppBar를 생성하여 앱의 상단 바를 제공
      appBar: AppBar(
        // InkWell 위젯을 사용하여 탭 가능한 영역을 생성
        title: GestureDetector(
          // onTap 이벤트 핸들러를 설정하여 클릭 시 "click"을 콘솔에 출력
          onTap: () {
            print("click");
          },
          // Row 위젯을 사용하여 자식 위젯들을 가로로 배열
          child: Row(
            children: [
              // Text 위젯을 사용하여 '합정동' 텍스트를 표시
              Text('합정동'),
              // Icon 위젯을 사용하여 아래 화살표 아이콘을 표시
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        // actions 속성을 사용하여 AppBar의 우측에 표시될 위젯들을 설정 (현재는 비어있음)
        //actions 속성은 List타입.
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

//여기 위젯에만 스타일과 배경색을 정해주게 되면, 매 페이지의 appBar를 수정해줘야 한다.