import 'package:flutter/material.dart'; // Flutter에서 제공하는 Material 디자인 관련 위젯을 사용하기 위해 필요한 패키지입니다.
import 'package:flutter_svg/flutter_svg.dart'; // SVG 이미지를 사용하기 위해 필요한 패키지입니다.
import 'package:intl/intl.dart'; // 숫자를 통화 형식으로 변환하기 위해 필요한 패키지입니다.

import 'resailhome.dart'; // ResailHome 위젯을 사용하기 위해 import합니다.

class App extends StatefulWidget {
  App({Key? key}) : super(key: key); // ResailHome 위젯의 생성자입니다.

  @override
  _AppState createState() =>
      _AppState(); // _ResailHomeState 상태 클래스의 인스턴스를 생성하여 반환합니다.
}

class _AppState extends State<App> {
  late int _currentPageIndex;
  //nullsafety버전에서는 이렇게 적어줘야 함.
  //late 키워드는 변수가 선언된 시점이 아닌 나중에 초기화될 것임을 나타냄.
  //변수가 선언된 시점에서는 초기화할 수 없지만, 확실히 접근하기 전에 초기화될 것임이 보장되는 경우.
  // 이 경우 late 키워드를 사용하면 non-nullable 변수를 선언하고 나중에 초기화할 수 있슴.

  //변수의 초기화가 비싼 연산을 포함하거나, 필요할 때까지 초기화를 미루고 싶은 경우. 이 경우 late 키워드를 사용하면 lazy initialization을 구현

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  //바디부분

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return ResailHome();
        break;
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        return Container();
        break;
    }
    return Container();
  }

  //공통된 것(바텀바 아이템들)은 한번에 빼주기.
  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset("assets/svg/${iconName}_off.svg", width: 22),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset("assets/svg/${iconName}_on.svg", width: 22),
        ),
        label: label);
  }

  // 바텀네비게이션부분
  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //아이템 클릭했을 때도 고정되어 있도록.
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      selectedFontSize: 12, //선택되었을 때 글자크기 조절
      currentIndex: _currentPageIndex,
      selectedItemColor: Colors.black,

      items: [
        _bottomNavigationBarItem("home", "홈"),
        _bottomNavigationBarItem("notes", "동네생활"),
        _bottomNavigationBarItem("location", "내 근처"),
        _bottomNavigationBarItem("chat", "채팅"),
        _bottomNavigationBarItem("user", "나의 당근"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 위젯을 사용하여 기본 앱 레이아웃을 생성합니다.
      //appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}

//여기 위젯에만 스타일과 배경색을 정해주게 되면, 매 페이지의 appBar를 수정해줘야 한다.
