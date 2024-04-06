import 'package:intl/intl.dart'; // intl 패키지를 가져옵니다.

class DataUtils {
  static final oCcy = new NumberFormat("###,###", "ko_KR"); // 숫자 포맷터를 생성합니다.

  // 가격을 원화 형식으로 변환하는 함수입니다.
  static String calcStringToWon(String priceString) {
    if (priceString == "무료나눔") {
      return priceString;
    }
    return "${oCcy.format(int.parse(priceString))}원";
  }
}
