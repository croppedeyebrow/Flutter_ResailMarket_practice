import 'package:flutter/material.dart'; // Flutter에서 제공하는 Material 디자인 관련 위젯을 사용하기 위해 필요한 패키지입니다.
import 'package:flutter_svg/flutter_svg.dart'; // SVG 이미지를 사용하기 위해 필요한 패키지입니다.

class ResailHome extends StatefulWidget {
  ResailHome({Key? key}) : super(key: key); // ResailHome 위젯의 생성자입니다.

  @override
  _ResailHomeState createState() =>
      _ResailHomeState(); // _ResailHomeState 상태 클래스의 인스턴스를 생성하여 반환합니다.
}

class _ResailHomeState extends State<ResailHome> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas = [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      }
    ];
  }

  //메서드는 하나에서 한가지의 역할만 수행해야 성능에 좋음.
  // appBar 프로퍼티에는 Widget이 아닌 PreferredSizeWidget가 와야함.
  PreferredSizeWidget _appbarWidget() {
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

  Widget _bodyWidget() {
    return ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int Index) {
          return Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(60)), // 모서리를 10.0 픽셀만큼 둥글게 잘라냅니다.
                  child: Image.asset(datas[Index]["image"]!),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int Index) {
          return Container(height: 1, color: Colors.black12.withOpacity(0.5));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 위젯을 사용하여 기본 앱 레이아웃을 생성합니다.
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      // bottomNavigationBar: Container(
      //   height: 10,
      //   color: Colors.orange,
      // ),
    );
  }
}


//여기 위젯에만 스타일과 배경색을 정해주게 되면, 매 페이지의 appBar를 수정해줘야 한다.  