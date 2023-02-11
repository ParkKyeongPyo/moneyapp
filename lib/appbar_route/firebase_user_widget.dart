import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FirebaseUserWidget extends StatelessWidget {
  const FirebaseUserWidget({super.key});
  
  //현재 상태 listen으로 계속 들으면서 상태 바뀌면 바로 로그인 state 변수 bool 바꿔주는 함수
  /*static bool isLogginFunction(bool isLoggin) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          return true;
        } else {
          return false;
        }
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}