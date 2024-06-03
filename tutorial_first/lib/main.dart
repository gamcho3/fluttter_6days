import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TutorialFirst());
}

class TutorialFirst extends StatelessWidget {
  const TutorialFirst({super.key});

  @override
  Widget build(BuildContext context) {
    // material design 앱 생성
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/image.jpg"),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  "박용진",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("email : qkrdydwls3@gmail.com"),
                SizedBox(
                  height: 10,
                ),
                Text("tel : 010-3072-7445"),
                SizedBox(
                  height: 10,
                ),
                // 버튼 위젯
                ElevatedButton(
                    onPressed: () {
                      print("click");
                      // 전화번호 연결
                      // Uri uriTel = Uri.parse("tel:+82-010-3072-7445");
                      // EMAIL 연결
                      Uri uri = Uri.parse(
                          "mailto:qkrdydwls3@gmail.com?subject=<subject>&body=<body>");
                      launchUrl(uri);
                    },
                    child: Text("Contact"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
