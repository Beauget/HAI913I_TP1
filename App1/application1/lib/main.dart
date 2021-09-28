import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeCardPage(title: 'Flutter FirstCard'),
    );
  }
}

class MyHomeCardPage extends StatefulWidget {
  const MyHomeCardPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomeCardPage> createState() => _MyHomeCardPageState();
}

class _MyHomeCardPageState extends State<MyHomeCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstCard"),
        centerTitle: false,
      ),
      body: Center(
        child: Stack(
            fit: StackFit.loose,
            overflow: Overflow.visible,
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Container(
                width: 300,
                height: 200,
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Denis Beauget"),
                        Text("azentiaytbpro@gmail.com"),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Icon(Icons.verified_user),
                                ),
                              ),
                              TextSpan(text: 'Twitter : XXXXX'),
                            ],
                          ),
                        )
                      ]),
                ),
                decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(14)),
              ),
              Positioned(
                width: 100,
                height: 100,
                left: 100,
                bottom: 130,
                child: Container(
                  width: 100,
                  height: 100,
                  //margin: EdgeInsets.only(left: 100, bottom: 200),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
