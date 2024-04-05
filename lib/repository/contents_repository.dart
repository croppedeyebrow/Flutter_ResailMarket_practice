class ContentsRepository {
  // 'datas'라는 이름의 Map 객체를 생성합니다. 이 Map의 키는 문자열이고, 값은 동적 타입입니다.
  Map<String, dynamic> datas = {
    // "합정동"이라는 키에 대한 값으로 빈 리스트를 할당합니다.
    // 이 리스트는 나중에 "합정동"에 관련된 데이터를 저장하는 데 사용될 수 있습니다.
    "합정동": [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "서울시 마포구 합정동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "서울시 마포구 합정동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "서울시 마포구 합정동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "서울시 마포구 합정동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "서울시 마포구 합정동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "서울시 마포구 합정동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "서울시 마포구 합정동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "서울시 마포구 합정동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "서울시 마포구 합정동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "서울시 마포구 합정동",
        "price": "50000",
        "likes": "7"
      }
    ],

    "신사동": [
      {
        "cid": "11",
        "image": "assets/images/ora-1.jpg",
        "title": "LG 통돌이세탁기 15kg(내부",
        "location": "서울시 은평구 신사동",
        "price": "150000",
        "likes": "13"
      },
      {
        "cid": "12",
        "image": "assets/images/ora-2.jpg",
        "title": "3단책장 전면책장 가져가실분",
        "location": "서울시 은평구 신사동",
        "price": "무료나눔",
        "likes": "6"
      },
      {
        "cid": "13",
        "image": "assets/images/ora-3.jpg",
        "title": "브리츠 컴퓨터용 스피커",
        "location": "서울시 은평구 신사동",
        "price": "1000",
        "likes": "4"
      },
      {
        "cid": "14",
        "image": "assets/images/ora-4.jpg",
        "title": "안락 의자",
        "location": "서울시 은평구 신사동",
        "price": "10000",
        "likes": "1"
      },
      {
        "cid": "15",
        "image": "assets/images/ora-5.jpg",
        "title": "어린이책 무료드림",
        "location": "서울시 은평구 신사동",
        "price": "무료나눔",
        "likes": "1"
      },
      {
        "cid": "16",
        "image": "assets/images/ora-6.jpg",
        "title": "어린이책 무료드림",
        "location": "서울시 은평구 신사동",
        "price": "무료나눔",
        "likes": "0"
      },
      {
        "cid": "17",
        "image": "assets/images/ora-7.jpg",
        "title": "칼세트 재제품 팝니다",
        "location": "서울시 은평구 신사동",
        "price": "20000",
        "likes": "5"
      },
      {
        "cid": "18",
        "image": "assets/images/ora-8.jpg",
        "title": "아이팜장난감정리함팔아요",
        "location": "서울시 은평구 신사동",
        "price": "30000",
        "likes": "29"
      },
      {
        "cid": "19",
        "image": "assets/images/ora-9.jpg",
        "title": "한색책상책장수납장세트 팝니다.",
        "location": "서울시 은평구 신사동",
        "price": "1500000",
        "likes": "1"
      },
      {
        "cid": "20",
        "image": "assets/images/ora-10.jpg",
        "title": "순성 데일리 오가닉 카시트",
        "location": "서울시 은평구 신사동",
        "price": "60000",
        "likes": "8"
      },
    ],

    // "봉천동": [
    //   {
    //     "cid": "1",
    //     "image": "assets/images/ara-1.jpg",
    //     "title": "네메시스 축구화275",
    //     "location": "제주 제주시 봉천동",
    //     "price": "30000",
    //     "likes": "2"
    //   },
    //   {
    //     "cid": "2",
    //     "image": "assets/images/ara-2.jpg",
    //     "title": "LA갈비 5kg팔아요~",
    //     "location": "제주 제주시 봉천동",
    //     "price": "100000",
    //     "likes": "5"
    //   },
    //   {
    //     "cid": "3",
    //     "image": "assets/images/ara-3.jpg",
    //     "title": "치약팝니다",
    //     "location": "제주 제주시 봉천동",
    //     "price": "5000",
    //     "likes": "0"
    //   },
    //   {
    //     "cid": "4",
    //     "image": "assets/images/ara-4.jpg",
    //     "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
    //     "location": "제주 제주시 봉천동",
    //     "price": "2500000",
    //     "likes": "6"
    //   },
    //   {
    //     "cid": "5",
    //     "image": "assets/images/ara-5.jpg",
    //     "title": "디월트존기임팩",
    //     "location": "제주 제주시 봉천동",
    //     "price": "150000",
    //     "likes": "2"
    //   },
    //   {
    //     "cid": "6",
    //     "image": "assets/images/ara-6.jpg",
    //     "title": "갤럭시s10",
    //     "location": "제주 제주시 봉천동",
    //     "price": "180000",
    //     "likes": "2"
    //   },
    //   {
    //     "cid": "7",
    //     "image": "assets/images/ara-7.jpg",
    //     "title": "선반",
    //     "location": "제주 제주시 봉천동",
    //     "price": "15000",
    //     "likes": "2"
    //   },
    //   {
    //     "cid": "8",
    //     "image": "assets/images/ara-8.jpg",
    //     "title": "냉장 쇼케이스",
    //     "location": "제주 제주시 봉천동",
    //     "price": "80000",
    //     "likes": "3"
    //   },
    //   {
    //     "cid": "9",
    //     "image": "assets/images/ara-9.jpg",
    //     "title": "대우 미니냉장고",
    //     "location": "제주 제주시 봉천동",
    //     "price": "30000",
    //     "likes": "3"
    //   },
    //   {
    //     "cid": "10",
    //     "image": "assets/images/ara-10.jpg",
    //     "title": "멜킨스 풀업 턱걸이 판매합니다.",
    //     "location": "제주 제주시 봉천동",
    //     "price": "50000",
    //     "likes": "7"
    //   }
    // ],
  };

  Future<List<Map<String, String>>> loadContentsFromLocation(
      String location) async {
    //Api통신 location값을 보내주면서  async await로 데이터를 지연시킨다.
    await Future.delayed(Duration(milliseconds: 1000));
    return datas[location];
  }
}
