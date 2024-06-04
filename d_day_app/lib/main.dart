import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme(bool isDark) {
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Home(
        chageTheme: (isDark) => changeTheme(isDark),
      ),
    );
  }
}

class Home extends StatefulWidget {
  final void Function(bool) chageTheme;

  const Home({super.key, required this.chageTheme});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;
  bool isEditing = false;
  String title = "우리 만난지";
  DateTime onlyDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime setDate = DateTime.now();
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: title);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int timeDiff = onlyDate.difference(setDate).inDays;
    final customTextStyle =
        GoogleFonts.nanumGothicCoding().copyWith(fontSize: 25);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("D-Day"),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                isDark = !isDark;
              });
              widget.chageTheme(isDark);
            },
          ),
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isEditing)
                Text(
                  title,
                  style: customTextStyle,
                ),
              if (isEditing)
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "제목을 입력해주세요"),
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${timeDiff > 0 ? timeDiff.toString().padLeft(timeDiff.toString().length + 1, '+') : timeDiff}",
                    style: customTextStyle.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "일째",
                    style: customTextStyle,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024, 1, 1),
                        lastDate: DateTime(2024, 12, 31));
                    setState(() {
                      setDate = date ?? setDate;
                    });
                    print(date);
                  },
                  child: Text(DateFormat('yyyy-MM-dd').format(setDate)))
            ],
          ),
        ),
      ),
    );
  }
}
