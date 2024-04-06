import 'package:flutter/material.dart';
import 'package:flutter_resailmarketpractice/page/detail.dart';
import 'package:flutter_resailmarketpractice/repository/contents_repository.dart';
import 'package:flutter_resailmarketpractice/utils/data_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// ResailHome 클래스는 StatefulWidget을 상속받는 위젯 클래스입니다.
// 이 위젯은 중고거래 앱의 홈 화면을 나타냅니다.
class ResailHome extends StatefulWidget {
  ResailHome({Key? key}) : super(key: key);

  @override
  _ResailHomeState createState() => _ResailHomeState();
}

// _ResailHomeState 클래스는 ResailHome 위젯의 상태를 관리하는 State 클래스입니다.
class _ResailHomeState extends State<ResailHome> {
  late String
      currentLocation; // 현재 선택된 지역을 저장하는 변수입니다. 'late' 키워드를 사용하여 초기화를 지연시킵니다.
  ContentsRepository contentsRepository =
      ContentsRepository(); // ContentsRepository 인스턴스를 생성합니다.

  // 지역 타입과 해당 지역 이름을 매핑하는 Map입니다.
  final Map<String, String> locationTypeToString = {
    "신사동": "신사동",
    "철산동": "철산동",
    "봉천동": "봉천동",
    "합정동": "합정동",
    "우면동": "우면동",
  };

  @override
  void initState() {
    super.initState();
    currentLocation = "합정동"; // 초기 선택된 지역을 "합정동"으로 설정합니다. 'late' 변수를 초기화합니다.
  }

  // 앱바 위젯을 생성하는 함수입니다.
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: PopupMenuButton<String>(
          offset: Offset(-15, 30),
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              1),
          onSelected: (String where) {
            setState(() {
              currentLocation = where; // 선택된 지역으로 현재 지역을 업데이트합니다.
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Center(child: Text("신사동")),
                value: "신사동",
              ),
              PopupMenuItem(
                child: Center(child: Text("철산동")),
                value: "철산동",
              ),
              PopupMenuItem(
                child: Center(child: Text("봉천동")),
                value: "봉천동",
              ),
              PopupMenuItem(
                child: Center(child: Text("합정동")),
                value: "합정동",
              ),
              PopupMenuItem(
                child: Center(child: Text("우면동")),
                value: "우면동",
              ),
            ];
          },
          child: Row(
            children: [
              Text(locationTypeToString[currentLocation] ??
                  ""), // 선택된 지역 이름을 표시합니다.
              Icon(Icons.arrow_drop_down), // 드롭다운 아이콘을 표시합니다.
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search), // 검색 아이콘 버튼입니다.
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune), // 필터 아이콘 버튼입니다.
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/svg/bell.svg", // 알림 아이콘 SVG 이미지입니다.
            width: 22,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  // 선택된 지역의 컨텐츠를 로드하는 비동기 함수입니다.
  // Future<List<Map<String, String>>> 타입으로 명시하여 반환 타입을 지정합니다.
  Future<List<Map<String, String>>> _loadContents() {
    return contentsRepository.loadContentsFromLocation(currentLocation);
  }

  // 데이터 리스트를 받아 ListView.separated를 사용하여 리스트를 생성하는 메서드입니다.
  Widget _makeDataList(List<Map<String, String>> datas) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: datas.length, // 데이터 리스트의 길이로 itemCount를 설정합니다.
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // 클릭 시 상세화면으로 이동하는 코드를 작성합니다.
            //클릭했을때 detail로 이동하면서 데이터를 넘겨줘야함.
            //네비게이터로 이동하면서 데이터를 넘겨준다.
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return DetailContentView(data: datas[index]);
            }));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                ClipRRect(
                  // 모든 모서리가 10 픽셀의 반경을 가진 원형으로 둥글게 잘라낸다.
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Hero(
                    // Hero 애니메이션의 태그로, datas[index]["cid"]를 사용한다.
                    // 만약 datas[index]["cid"]가 null이면, 빈 문자열("")을 기본값으로 사용한다.
                    tag: datas[index]["cid"] ?? "",
                    child: Image.asset(
                      // 이미지의 경로는 datas[index]["image"]를 사용한다.
                      // 만약 datas[index]["image"]가 null이면, 빈 문자열("")을 기본값으로 사용한다.
                      datas[index]["image"] ?? "",
                      // 이미지의 너비를 100 픽셀로 설정한다.
                      width: 100,
                      // 이미지의 높이를 100 픽셀로 설정한다.
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datas[index]["title"] ??
                              "", // 제목입니다. null safety를 고려하여 ?? 연산자로 기본값을 제공합니다.
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          datas[index]["location"] ??
                              "", // 위치입니다. null safety를 고려하여 ?? 연산자로 기본값을 제공합니다.
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black26.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          DataUtils.calcStringToWon(datas[index]["price"] ??
                              "0"), // 가격입니다. null safety를 고려하여 ?? 연산자로 기본값을 제공합니다.
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/heart_off.svg", // 좋아요 아이콘 SVG 이미지입니다.
                                width: 14,
                                height: 14,
                              ),
                              SizedBox(width: 5),
                              Text(datas[index]["likes"] ??
                                  "0"), // 좋아요 수입니다. null safety를 고려하여 ?? 연산자로 기본값을 제공합니다.
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black12.withOpacity(0.5), // 구분선입니다.
        );
      },
    );
  }

  // 바디 위젯을 생성하는 함수입니다.
  // Widget _bodyWidget() {
  //   return FutureBuilder(
  //     future: _loadContents(), // 비동기로 컨텐츠를 로드합니다.
  //     builder: (BuildContext context,
  //         AsyncSnapshot<List<Map<String, String>>?> snapshot) {
  //       if (snapshot.connectionState != ConnectionState.done) {
  //         return Center(
  //             child: CircularProgressIndicator()); // 로딩 중인 경우 로딩 인디케이터를 표시합니다.
  //       }
  //       if (snapshot.hasError) {
  //         return Center(child: Text("데이터 오류")); // 오류가 발생한 경우 오류 메시지를 표시합니다.
  //       }
  //       if (snapshot.hasData) {
  //         return _makeDataList(snapshot.data ??
  //             []); // 데이터가 있는 경우 _makeDataList 메서드를 호출하여 리스트를 생성합니다.
  //       }
  //       return Center(
  //           child: Text("해당 지역에 데이터가 없습니다.")); // 데이터가 없는 경우 해당 메시지를 표시합니다.
  //     },
  //   );
  // }

  Widget _bodyWidget() {
    return FutureBuilder(
      future: _loadContents(), // 비동기로 컨텐츠를 로드합니다.
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, String>>?> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
              child: CircularProgressIndicator()); // 로딩 중인 경우 로딩 인디케이터를 표시합니다.
        }

        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return Center(
              child: Text("해당 지역에 데이터가 없습니다.")); // 데이터가 없는 경우 해당 메시지를 표시합니다.
        }
        if (snapshot.hasData) {
          return _makeDataList(
              snapshot.data!); // 데이터가 있는 경우 _makeDataList 메서드를 호출하여 리스트를 생성합니다.
        }
        // if (snapshot.hasError) {
        //   return Center(child: Text("데이터 오류")); // 오류가 발생한 경우 오류 메시지를 표시합니다.
        // }
        return Center(
            child: Text("해당 지역에 데이터가 없습니다.")); // 데이터가 없는 경우 해당 메시지를 표시합니다.
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(), // 앱바 위젯을 표시합니다.
      body: _bodyWidget(), // 바디 위젯을 표시합니다.
    );
  }
}
