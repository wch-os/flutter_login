import 'package:flutter/material.dart';

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

class _LogInState extends State<LogIn> {
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

      /*
      SingleCHildScrollView
      키보드가 스크린 영역을 차지할 때 차지한 영역만큼을
      스크린 화면이 스크롤 될 수 있게 만들어줌
       */
      body: SingleChildScrollView(
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
                        //레이블을 써주기 위해서
                        decoration: InputDecoration(
                          labelText: 'Enter "dice"',
                        ),
                        // keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter PassWord',
                        ),
                        keyboardType: TextInputType.text,

                        //암호화 => 문자 표시 x
                        obscureText: true,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter "dice"',
                        ),
                        // keyboardType: TextInputType.emailAddress,
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
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
