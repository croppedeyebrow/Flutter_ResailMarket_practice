// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resailmarketpractice/components/manor_temperature_widget.dart';

class DetailContentView extends StatefulWidget {
  final Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
//initState() 메서드는 context에 접근할 수 없기 때문에,
// didChangeDependencies() 메서드를 사용하여 context에 접근합니다.
  List<Map<String, String>> imgList = [];
  int _current = 0;
  Size size = Size.zero;
  // Size 클래스는 너비와 높이를 나타내는 클래스입니다.
  // Size 클래스는 두 개의 속성을 가지고 있습니다.
  // .zero는 너비와 높이가 0인 Size 객체를 생성합니다.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      {"id": "0", "url": widget.data["image"]!},
      {"id": "1", "url": widget.data["image"]!},
      {"id": "2", "url": widget.data["image"]!},
      {"id": "3", "url": widget.data["image"]!},
      {"id": "4", "url": widget.data["image"]!},
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context); // 페이지 히스토리를 제거하면서 뒤로가기 기능
        },
        icon: Icon(Icons.arrow_back, color: Colors.white),
      ),
      title: Text(
        "상세화면",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share),
          color: Colors.white, // 검색 아이콘 버튼입니다.
        ),
        IconButton(
          onPressed: () {
            print("menu click");
          },
          icon: Icon(Icons.more_vert),
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _makeSliderImage() {
    return Container(
      child: Stack(children: [
        Hero(
          tag: widget.data["cid"]!,
          child: CarouselSlider(
            options: CarouselOptions(
              height: size.width, // 이미지의 높이를 화면의 너비로 설정합니다.
              initialPage: 0, // 초기 페이지를 설정합니다.
              enableInfiniteScroll: false, // 무한 스크롤을 비활성화합니다.
              viewportFraction: 1, // 이미지가 화면 전체에 출력되도록 설정합니다.
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
                // 페이지가 변경될 때 호출될 함수를 정의합니다.
                print("index: $index");
              },
            ),
            items: imgList.map(
              (map) {
                return Image.asset(
                  map["url"]!,
                  width: size.width,
                  fit: BoxFit.fill,
                );
              },
            ).toList(),
          ),
        ),

        //여기서부터 인디케이터 부분
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((map) {
              return Container(
                child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == int.parse(map["id"]!)
                            ? Colors.white
                            : Colors.white.withOpacity(0.4))),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }

  Widget _sellerSimpleInfo() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //     child: Image.asset("assets/images/user.png"),
          //   ),
          // ),

          CircleAvatar(
            backgroundImage: Image.asset("assets/images/user.png").image,
            //backgoundImage는 이미지를 설정할 때 image라는 provider를 사용합니다.
            radius: 20,
          ),
          SizedBox(
            width: 14,
          ),
          // 정보를 표시.
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //가로로 시작점을 잡아주는것.
            children: [
              Text("눈썹",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text("서울시 마포구", style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          //여기서부터는 판매자의 평점(매너온도)을 표시합니다.
          Expanded(
            child: ManorTemperature(
              manorTemp: 38.5,
            ),
          )
        ],
      ),
    );
  }

  Widget _line() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey.withOpacity(0.25),
      height: 1,
    );
  }

  Widget _contentDetail() {
    return Container(
      child: Column(
        children: [
          Text(widget.data["title"]!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(
            "작은카테고리/ 큰 카테고리 * 업로드시간",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.withOpacity(0.4)),
          ),
          Text(
            "상품에 대한 정보를 입력해주세요 100자이상 1000자이내로 입력해주세요.",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.withOpacity(0.4)),
          )
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _makeSliderImage(),
        _sellerSimpleInfo(),
        _line(),
        SizedBox(
          height: 10,
        ),
        _contentDetail()
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: size.width,
      height: 56,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // bpdy영역이 appbar영역까지 확장되도록 함.
      appBar: _appbarWidget(), // 앱바 위젯을 표시합니다.
      body: _bodyWidget(), // 바디 위젯을 표시합니다.
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
