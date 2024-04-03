import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ResailHome extends StatefulWidget {
  ResailHome({Key? key}) : super(key: key);

  @override
  _ResailHomeState createState() => _ResailHomeState();
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

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  //앱바부분

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
        child: PopupMenuButton<String>(
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              1),
          onSelected: (String where) {
            print(where);
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("신사동"), // 메뉴1을 표시하는 PopupMenuItem 위젯입니다.
                value: "신사동", // 메뉴1의 값을 설정합니다.
              ),
              PopupMenuItem(
                child: Text("철산동"), // 메뉴2를 표시하는 PopupMenuItem 위젯입니다.
                value: "철산동", // 메뉴2의 값을 설정합니다.
              ),
              PopupMenuItem(
                child: Text("봉천동"), // 메뉴3을 표시하는 PopupMenuItem 위젯입니다.
                value: "봉천동", // 메뉴3의 값을 설정합니다.
              ),
              PopupMenuItem(
                child: Text("합정동"), // 메뉴3을 표시하는 PopupMenuItem 위젯입니다.
                value: "합정동", // 메뉴3의 값을 설정합니다.
              ),
              PopupMenuItem(
                child: Text("우면동"), // 메뉴3을 표시하는 PopupMenuItem 위젯입니다.
                value: "우면동", // 메뉴3의 값을 설정합니다.
              ),
            ];
          },
          child: Row(
            // Row를 사용하여 자식 위젯을 가로로 배열합니다.
            children: [
              Text('합정동'), // '합정동' 텍스트를 표시하는 Text 위젯입니다.
              Icon(Icons.arrow_drop_down), // 아래 화살표 아이콘을 표시하는 Icon 위젯입니다.
            ],
          ),
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

  //바디부분

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: 10,
      itemBuilder: (BuildContext context, int Index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)), // 모서리를 10.0 픽셀만큼 둥글게 잘라냅니다.
                child: Image.asset(datas[Index]["image"].toString(),
                    width: 100, height: 100),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  //이 컨테이너를 Expanded로 다시 한번 감싸주게 되면,
                  //위쪽에 있는 ClipRRect 위젯이 차지하지 못하는 나머지 공간을 여기서 모두 활용하게 됩니다.
                  height: 100,

                  child: Column(

                      //Expanded 위젯에 범위를 부모에서 지정해주면, 나머지 공간을 차지하게 된다.
                      //Column은 범위가 없기 때문에, 더 상단인 Container에서 지정해줘야한다.
                      //mainAxisAligment는 Column의 세로 정렬을 맞추기 위해 사용한다.
                      //Column들의 가로 정렬을 맞추기 위해 crossAxisAlignment를 사용한다.
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datas[Index]["title"].toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          overflow:
                              TextOverflow.ellipsis, //글자가 너무 길면 ..으로 생략되게 한다.
                        ),
                        SizedBox(height: 4), //간격조정
                        Text(
                          datas[Index]["location"].toString(),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black26.withOpacity(0.4)),
                        ),
                        SizedBox(height: 4), //간격조정
                        Text(
                          calcStringToWon(datas[Index]["price"].toString()),
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/heart_off.svg",
                                width: 14,
                                height: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(datas[Index]["likes"].toString()),
                            ],
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int Index) {
        return Container(height: 1, color: Colors.black12.withOpacity(0.5));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
