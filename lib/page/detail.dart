import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  final Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
//initState() 메서드는 context에 접근할 수 없기 때문에,
// didChangeDependencies() 메서드를 사용하여 context에 접근합니다.
  Size size = Size.zero;
  // Size 클래스는 너비와 높이를 나타내는 클래스입니다.
  // Size 클래스는 두 개의 속성을 가지고 있습니다.
  // .zero는 너비와 높이가 0인 Size 객체를 생성합니다.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context); // 뒤로가기 기능
        },
        icon: Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: Text(
        "상세화면",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share),
          color: Colors.black, // 검색 아이콘 버튼입니다.
        ),
        IconButton(
          onPressed: () {
            print("menu click");
          },
          icon: Icon(Icons.more_vert),
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Container(
        child: Hero(
      tag: widget.data["cid"]!,
      child: Image.asset(
        widget.data["image"]!,
        width: size.width,
        // 이미지의 너비를 화면의 너비로 설정합니다.
        fit: BoxFit.fill,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // bpdy영역이 appbar영역까지 확장되도록 함.
      appBar: _appbarWidget(), // 앱바 위젯을 표시합니다.
      body: _bodyWidget(), // 바디 위젯을 표시합니다.
    );
  }
}
