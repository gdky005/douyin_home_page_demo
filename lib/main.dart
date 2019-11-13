import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          _firstFloorWidget(),
          _secondFloorWidget(),
        ],
      )),
    );
  }

  /// 最底层的 PageView
  PageView _firstFloorWidget() {
    return PageView.custom(
      scrollDirection: Axis.vertical,
      childrenDelegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          color: Colors.grey[100 * index],
          child: Center(child: Text("当前是：$index")),
        );
      }, childCount: 10),
    );
  }

  /// 第二层的顶部和底部按钮区域
  Row _secondTopFloorWidget() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search, size: 32),
            onPressed: () => print("点击搜索"),
          ),
          Row(
            children: <Widget>[
              InkWell(
                child: Text(
                  "关注",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () => print("点击 关注"),
              ),
              SizedBox(width: 10),
              GestureDetector(
                child: Text(
                  "推荐",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () => print("点击 推荐"),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.live_tv, size: 32),
            onPressed: () => print("点击直播"),
          ),
        ]);
  }

  Padding _secondFloorWidget() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _secondTopFloorWidget(),
            _secondBottomFloorWidget(),
          ],
        ));
  }

  Widget _secondBottomFloorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          child: Text(
            "关注1",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 关注"),
        ),
        InkWell(
          child: Text(
            "关注2",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 关注"),
        ),
        InkWell(
          child: Text(
            "关注3",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 关注"),
        ),
        InkWell(
          child: Text(
            "关注4",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 关注"),
        ),
        InkWell(
          child: Text(
            "关注5",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 关注"),
        ),
      ],
    );
  }
}
