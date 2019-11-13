import 'package:flutter/cupertino.dart';
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
            Column(
              children: <Widget>[
                _secondCenterFloorWidget(),
                _secondBottomFloorWidget(),
              ],
            ),
          ],
        ));
  }

  Widget _secondBottomFloorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          child: Text(
            "首页",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 首页"),
        ),
        InkWell(
          child: Text(
            "同城",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 同城"),
        ),
        IconButton(
            icon: Icon(Icons.add_circle_outline, size: 36),
            onPressed: () => print("点击 添加")),
        InkWell(
          child: Text(
            "消息",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 消息"),
        ),
        InkWell(
          child: Text(
            "我",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onTap: () => print("点击 我"),
        ),
      ],
    );
  }

  Widget _secondCenterFloorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _secondCenterLeftFloorWidget(),
        _secondCenterRightFloorWidget(),
      ],
    );
  }

  Widget _secondCenterLeftFloorWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("@ 作者名字"),
        SizedBox(height: 20),
        Text("短视频\n介绍\n区域", maxLines: 3, overflow: TextOverflow.ellipsis),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Icon(Icons.music_note),
            Text("音乐名称"),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _secondCenterRightFloorWidget() {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Icon(Icons.person_outline,
                      size: 50, color: Colors.grey[400]),
                ),
                SizedBox(height: 10),
              ],
            ),
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Icon(Icons.add, size: 25, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: <Widget>[
            Icon(Icons.favorite, size: 50),
            Text("48.7w"),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: <Widget>[
            Icon(Icons.comment, size: 50),
            Text("1.4w"),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: <Widget>[
            Icon(Icons.screen_share, size: 42),
            Text("2.4w"),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: Icon(Icons.music_note, size: 50, color: Colors.white),
        )
      ],
    );
  }
}
