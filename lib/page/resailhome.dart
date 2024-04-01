import 'package:flutter/material.dart'; // Flutter에서 제공하는 Material 디자인 관련 위젯을 사용하기 위해 필요한 패키지입니다.
import 'package:flutter_svg/flutter_svg.dart'; // SVG 이미지를 사용하기 위해 필요한 패키지입니다.

class ResailHome extends StatefulWidget {
  ResailHome({Key? key}) : super(key: key); // ResailHome 위젯의 생성자입니다.

  @override
  _ResailHomeState createState() =>
      _ResailHomeState(); // _ResailHomeState 상태 클래스의 인스턴스를 생성하여 반환합니다.
}

class _ResailHomeState extends State<ResailHome> {
  //메서드는 하나에서 한가지의 역할만 수행해야 성능에 좋음.
  // appBar 프로퍼티에는 Widget이 아닌 PreferredSizeWidget가 와야함.
  PreferredSizeWidget _appbarwidget() {
    return AppBar(
      // AppBar를 생성하여 앱의 상단 바를 표시합니다.
      title: GestureDetector(
        // GestureDetector를 사용하여 탭 이벤트를 처리할 수 있는 영역을 생성합니다.
        onTap: () {
          // 탭 이벤트 핸들러입니다.
          print("click"); // 탭시 "click"을 출력합니다.
        },
        child: Row(
          // Row를 사용하여 자식 위젯을 가로로 배열합니다.
          children: [
            Text('합정동'), // '합정동' 텍스트를 표시하는 Text 위젯입니다.
            Icon(Icons.arrow_drop_down), // 아래 화살표 아이콘을 표시하는 Icon 위젯입니다.
          ],
        ),
      ),
      actions: [
        // AppBar 우측에 표시될 위젯들을 설정합니다.
        IconButton(
          onPressed: () {}, // onPressed 이벤트 핸들러를 설정합니다.
          icon: Icon(Icons.search), // 검색 아이콘을 표시하는 IconButton 위젯입니다.
        ),
        IconButton(
          onPressed: () {}, // onPressed 이벤트 핸들러를 설정합니다.
          icon: Icon(Icons.tune), // 설정 아이콘을 표시하는 IconButton 위젯입니다.
        ),
        IconButton(
          onPressed: () {}, // onPressed 이벤트 핸들러를 설정합니다.
          icon: SvgPicture.asset(
            // SVG 이미지를 표시하는 IconButton 위젯입니다.
            "assets/svg/bell.svg", // 이미지 파일 경로를 설정합니다.
            width: 22, // 이미지의 너비를 설정합니다.
            color: Colors.white, // 이미지의 색상을 설정합니다.
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 위젯을 사용하여 기본 앱 레이아웃을 생성합니다.
      appBar: _appbarwidget(),
      body: Container(),
      bottomNavigationBar: Container(),
    );
  }
}


//여기 위젯에만 스타일과 배경색을 정해주게 되면, 매 페이지의 appBar를 수정해줘야 한다.