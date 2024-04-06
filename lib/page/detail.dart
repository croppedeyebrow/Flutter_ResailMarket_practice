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
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.data["title"]!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(
            height: 8,
          ),
          Text(
            "작은카테고리/ 큰 카테고리 * 업로드시간",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.withOpacity(0.4)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "상품에 대한 정보를 입력해주세요 100자이상 1000자이내로 입력해주세요. \n "
            "허위사실을 작성하거나 위법에 해당되는 물건을 판매하는 행위는 \n 법적조치의 대상이 될 수 있습니다 \n "
            "거래당사자의 실수로 발생하는 문제는 당근마켓에서 책임지지 않습니다 \n "
            "입금 및 대면 거래시 거대 상대방의 정보를 잘 확인하세요",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 2, //줄간격을 조정합니다.
                fontSize: 12,
                color: Colors.grey.withOpacity(0.8)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "채팅 3 · 관심 17 · 조회 295",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.withOpacity(0.4)),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _reportzone() {
    return InkWell(
      onTap: () {
        print("신고하기 클릭");
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              "불량 게시물 신고",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }

  Widget _otherSellContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "판매자님의 다른 판매 상품",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            " 모두 보기",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return CustomScrollView(
        // CustomScrollView는 여러 슬라이버 위젯을 사용하여 스크롤 가능한 영역을 생성합니다.
        slivers: [
          SliverList(
            // SliverList는 슬라이버 위젯 중 하나로, 일반적인 리스트와 유사하게 작동합니다.
            delegate: SliverChildListDelegate(
              [
                _makeSliderImage(), // 이미지 슬라이더를 생성하는 메서드
                _sellerSimpleInfo(), // 판매자 정보를 간략하게 보여주는 메서드
                _line(), // 구분선을 생성하는 메서드
                _contentDetail(), // 상품의 상세 정보를 보여주는 메서드
                _line(), // 구분선을 생성하는 메서드
                _reportzone(), // 신고하기 영역을 생성하는 메서드
                _line(), // 구분선을 생성하는 메서드
                _otherSellContent(), // 판매자의 다른 상품 정보를 보여주는 메서드
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15), //패딩을 만들어주고
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(List.generate(20, (index) {
                return Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(0.3),
                      height: 140,
                      width: 200,
                    ),
                    Text(
                      "상품명",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "가격",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ));
              }).toList()),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //gridDelgate를 사용하여 그리드 레이아웃을 생성합니다.
                //추후에 인스타그램에도 활용 가능.
                crossAxisCount: 2, //3개의 열을 만들어줍니다.
                crossAxisSpacing: 8, //열과 열 사이의 간격을 5로 설정합니다.
                mainAxisSpacing: 8, //행과 행 사이의 간격을 5로 설정합니다.
              ),
            ),
          ),
        ]);
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
