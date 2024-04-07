// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resailmarketpractice/components/manor_temperature_widget.dart';
import 'package:flutter_resailmarketpractice/repository/contents_repository.dart';
import 'package:flutter_resailmarketpractice/utils/data_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DetailContentView extends StatefulWidget {
  final Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView>
    with TickerProviderStateMixin {
//initState() 메서드는 context에 접근할 수 없기 때문에,
// didChangeDependencies() 메서드를 사용하여 context에 접근합니다.

  final scaffoldKey = GlobalKey<ScaffoldState>();
  //scaffoldKey는 Scaffold 위젯의 상태를 제어하기 위한 키입니다.
  List<Map<String, String>> imgList = [];
  int _current = 0;
  Size size = Size.zero;
  double scrollpositionToAlpha = 0;
  ScrollController _controller = ScrollController();
  AnimationController? _animationController;
  late Animation<Color?> _colorTween;
  bool isMyFavoriteContents = false;
  final ContentsRepository contentsRepository =
      ContentsRepository(); // ContentsRepository 인스턴스를 생성합니다. 데이터에 접근하기 위해서.

  // AnimationController는 애니메이션을 제어하는 클래스입니다.
  // Size 클래스는 너비와 높이를 나타내는 클래스입니다.
  // Size 클래스는 두 개의 속성을 가지고 있습니다.
  // .zero는 너비와 높이가 0인 Size 객체를 생성합니다.

  @override
  void initState() {
    super.initState();
    isMyFavoriteContents = false;
    final contentsRepository = ContentsRepository();
    _animationController = AnimationController(vsync: this);
    _colorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController!);
    _controller.addListener(() {
      // 스크롤 위치에 따라 앱바의 색상을 변경합니다.
      print("스크롤 위치: ${_controller.offset}");
      setState(() {
        if (_controller.offset > 255) {
          scrollpositionToAlpha = 255;
        } else {
          scrollpositionToAlpha = _controller.offset;
        }
        _animationController!.value = scrollpositionToAlpha / 255;
      });
      //스코롤의 위치를 알려주는 offset
      //이제 이 값을 appbar의 backgroundcolor에 넣어주면 됨.
    });
    _loadMyFavoriteContentState();
  }

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

  //저장한 값을 불러오기.
  _loadMyFavoriteContentState() async {
    bool savecheck =
        await contentsRepository.isMyFavoriteContents(widget.data["cid"]!);
    setState(() {
      isMyFavoriteContents = savecheck;
    });
    print(savecheck);
  }

  // 아이콘 위젯을 생성하고, 색상이 애니메이션에 따라 변하도록 하는 함수
  Widget _makeIcon(IconData icon) {
    return AnimatedBuilder(
        animation: _colorTween, // 색상 변화 애니메이션
        builder: (context, child) =>
            Icon(icon, color: _colorTween.value) // 색상이 변하는 아이콘 위젯
        );
  }

// 텍스트 위젯을 생성하고, 색상이 애니메이션에 따라 변하도록 하는 함수
  Widget _makeText(String data, {TextStyle? style}) {
    return AnimatedBuilder(
      animation: _colorTween, // 색상 변화 애니메이션
      builder: (context, child) => Text(
        data,
        style: style?.copyWith(color: _colorTween.value), // 색상이 변하는 텍스트 스타일
      ),
    );
  }

// 앱바 위젯을 생성하는 함수
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      // 배경색은 스크롤 위치에 따라 투명도가 변함
      backgroundColor: Colors.white.withAlpha(scrollpositionToAlpha.toInt()),
      elevation: 0, // 앱바의 그림자 없음
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 버튼 클릭 시, 이전 페이지로 이동
          },
          icon: _makeIcon(Icons.arrow_back) // 뒤로가기 아이콘
          ),
      title: _makeText(
        "상세화면",
        style: TextStyle(color: Colors.white), // 제목 텍스트
      ),
      actions: [
        IconButton(
          onPressed: () {}, // 아직 기능이 정의되지 않음
          icon: _makeIcon(Icons.share), // 공유 아이콘
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            print("menu click"); // 메뉴 버튼 클릭 시, 콘솔에 메시지 출력
          },
          icon: _makeIcon(Icons.more_vert), // 메뉴 아이콘
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
        //이곳에 컨트롤러를 추가해서 스크롤 위치에 따른 앱바의 색상값을 조절해줍니다.
        controller: _controller,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.grey.withOpacity(0.3),
                        height: 140,
                        width: 200,
                      ),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        height: 44,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                contentsRepository.addMyFavoriteContents(widget.data);
                print("관심상품 체크");
                setState(() {
                  //토글형식으로 작동하도록 설정.
                  //이 때 로컬스토리지에 접근하도록 설정합니다.
                  //true면 false로, false면 true로 바꿔줍니다.
                  isMyFavoriteContents = !isMyFavoriteContents;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(milliseconds: 2000),
                    content: Text(
                      isMyFavoriteContents == true
                          ? "내 관심 상품 목록에 추가되었습니다."
                          : "내 관심 상품 목록에서 제거되었습니다.",
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(
                isMyFavoriteContents == true
                    ? "assets/svg/heart_on.svg"
                    : "assets/svg/heart_off.svg",
                width: 24,
                height: 24,
                color: Color(0xfff08f4f),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: 1,
                height: 36,
                color: Colors.grey.withOpacity(0.2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DataUtils.calcStringToWon(widget.data["price"]!),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "판매자에게 가격을 제안하기",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "채팅으로 거래하기",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xfff08f4f),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      // bpdy영역이 appbar영역까지 확장되도록 함.
      appBar: _appbarWidget(), // 앱바 위젯을 표시합니다.
      body: _bodyWidget(), // 바디 위젯을 표시합니다.
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
