import 'package:flutter/material.dart';
import './animalItem.dart';
import 'sub/FirstPage.dart';
import 'sub/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
        ),
        body: TabBarView(
          children: <Widget>[
            FirstApp(list: animalList),
            SecondApp(list: animalList)
          ],
          // 인자로 꼭 꼭 넣어두자 이거 잊으면 안된다.
          controller: controller,
        ),
        bottomNavigationBar: TabBar(
          tabs: <Tab>[
            Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
            Tab(icon: Icon(Icons.looks_two, color: Colors.blue)),
          ],
          controller: controller,
        ));
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(
        Animal(animalName: '벌', kind: '곤층', imagePath: "repo/image/bee.png"));
    animalList.add(Animal(
        animalName: '고양이', kind: '포유류', imagePath: "repo/image/cat.png"));
    animalList.add(
        Animal(animalName: '젖소', kind: '포유류', imagePath: "repo/image/cow.png"));
    animalList.add(Animal(
        animalName: '강아지', kind: '포유류', imagePath: "repo/image/dog.png"));
    animalList.add(
        Animal(animalName: '여우', kind: '포유류', imagePath: "repo/image/fox.png"));
    animalList.add(Animal(
        animalName: '원숭이', kind: '영장류', imagePath: "repo/image/monkey.png"));
    animalList.add(
        Animal(animalName: '돼지', kind: '포유류', imagePath: "repo/image/pig.png"));
    animalList.add(Animal(
        animalName: '늑대', kind: '포유류', imagePath: "repo/image/wolf.png"));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
