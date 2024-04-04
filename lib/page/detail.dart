import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  final Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text("상세화면"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          color: Colors.black, // 검색 아이콘 버튼입니다.
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune),
          color: Colors.black, // 필터 아이콘 버튼입니다.
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
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(), // 앱바 위젯을 표시합니다.
      body: _bodyWidget(), // 바디 위젯을 표시합니다.
    );
  }
}
