import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koala_app/pages/approval_page.dart';
import 'package:koala_app/pages/cost_page.dart';
import 'package:koala_app/pages/home_page.dart';
import 'package:koala_app/pages/invoice_page.dart';
import 'package:koala_app/pages/profile_page.dart';
import 'package:koala_app/routers/application.dart';
import 'package:koala_app/routers/routes.dart';

class IndexApp extends StatefulWidget {
  _IndexAppState createState() => _IndexAppState();
}

class _IndexAppState extends State<IndexApp> with SingleTickerProviderStateMixin {
  _IndexAppState() {
    final router = new FluroRouter();
    // final eventBus = new EventBus();
    Routes.configureRoutes(router);
    Application.router = router;
    // ApplicationEvent.event = eventBus;
  }

  // TabController _tabController;

  String _userName = '';
  String _userPic = '';

  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  var _controller = PageController(initialPage: 0);
  int _currentIndex = 0;
  double _tabBarImageHeight = 21.0;
  DateTime _lastPressedAt; //上次点击时间

  @override
  void initState() {
    super.initState();
    // _tabController = new TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(
          // primaryColor: const Color.fromRGBO(77, 145, 253, 1.0),
          // accentColor: const Color(0xFFB2BAC2),
        ),
        home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.black12,
          //   title: Text('考拉费用管理'),
          // ),
          body: WillPopScope (
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: <Widget>[
                  HomePage(title: '首页'),
                  CostPage(title: '费用申请'),
                  InvoicePage(title: '发票'),
                  ApprovalPage(title: '审批'),
                  ProfilePage(title: '我的'),
                ],
            ),
            onWillPop: exitApp,
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 12,
              unselectedFontSize: 12,
              currentIndex: _currentIndex,
              onTap: (index) {
                _controller.jumpToPage(index);
                setState(() {
                  _currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                _bottomItem(Image(image: AssetImage('assets/tabBar/dis_home.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), Image(image: AssetImage('assets/tabBar/home.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), '首页', 0),
                _bottomItem(Image(image: AssetImage('assets/tabBar/dis_cost.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), Image(image: AssetImage('assets/tabBar/cost.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), '费用申请', 1),
                _bottomItem(Image(image: AssetImage('assets/tabBar/dis_invoice.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), Image(image: AssetImage('assets/tabBar/invoice.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), '发票', 2),
                _bottomItem(Image(image: AssetImage('assets/tabBar/dis_approval.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), Image(image: AssetImage('assets/tabBar/approval.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), '审批', 3),
                _bottomItem(Image(image: AssetImage('assets/tabBar/dis_me.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), Image(image: AssetImage('assets/tabBar/me.png'), width: _tabBarImageHeight, height: _tabBarImageHeight), '我的', 4)
              ]),
        ),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }

  //底部导航item
  BottomNavigationBarItem _bottomItem(Widget icon, Widget activeIcon, String title, int index) {
    return BottomNavigationBarItem(
        icon: icon,
        activeIcon: activeIcon,
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }

  //退出app
  Future<bool> exitApp() {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      Fluttertoast.showToast(
          msg: "再按一次退出应用",
          backgroundColor: Colors.grey,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 14);
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      return Future.value(false);
    }
    return Future.value(true);
    /*return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text("是否退出"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定"))
              ],
            ));*/
  }
}
