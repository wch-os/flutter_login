import 'package:flutter/material.dart';

import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

//TextField에 있는 값을 읽을 때 사용
class _LogInState extends State<LogIn> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),

      //snack bar에 context를 전달해주기 위해서 Builder로 감싸줌, 18-19번
      /*
      SingleCHildScrollView
      키보드가 스크린 영역을 차지할 때 차지한 영역만큼을
      스크린 화면이 스크롤 될 수 있게 만들어줌
       */
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Center(
                  child: Image(
                    image: AssetImage('image/chef.gif'),
                    width: 170,
                    height: 190,
                  ),
                ),
                Form(
                  //Form 디자인
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    //하나의 child 밖에 가질 수 없음
                    child: Container(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          TextField(
                            controller: controller1,
                            //레이블을 써주기 위해서
                            decoration: InputDecoration(
                              labelText: 'Enter ID',
                            ),
                            // keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: controller2,
                            decoration: InputDecoration(
                              labelText: 'Enter PassWord',
                            ),
                            keyboardType: TextInputType.text,

                            //문자 표시 x
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ButtonTheme(
                            minWidth: 100,
                            height: 50,
                            child: ElevatedButton(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 35,
                              ),
                              onPressed: () {
                                if (controller1.text == "sunho" &&
                                    controller2.text == "1234") {
                                  //페이지 이동, 22강
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Dice()));
                                } else if (controller1.text != "sunho" && controller2.text == "1234") {
                                  showSnackBar2(context);
                                } else if (controller2.text != "1234" && controller1.text == "sunho") {
                                  showSnackBar3(context);
                                } else {
                                  showSnackBar1(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//snack bar 함수
//매개변수는 build context의 context
void showSnackBar1(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '로그인 정보를 확인하세요',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 5),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'ID가 일치하지 않습니다.',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 5),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'PassWord가 일치하지 않습니다.',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 5),
      backgroundColor: Colors.blue,
    ),
  );
}
