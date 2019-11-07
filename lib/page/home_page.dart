import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// plugins
import 'package:flutter_swiper/flutter_swiper.dart';

// dao
import '../dao/home_dao.dart';

// module
import '../modle/banner_list_module.dart';
import '../modle/home_module.dart';

// page

// widget
import '../widget/loading_container.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打开点 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _appBarAlpha = 0; // appbar 透明度
  List<BannerListModule> _bannerList = [];
  bool _isLoading = true;

  _onScroll(offset) { // 页面滚动监听
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0) alpha = 0;
    if(alpha > 1) alpha = 1;
    setState(() {
     _appBarAlpha = alpha; 
    });
  }

  Future<void> _handleRefresh() async {  // 下拉刷新处理函数
    try {
      HomeModule homeModule = await HomeDao.fetch();
      setState(() {
        _bannerList = homeModule.bannerList;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  // initState
  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: _isLoading,
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                      // 列表滚动时
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return false;
                  },
                  child: ListView(
                    children: <Widget>[
                      BannerWidget(bannerList: _bannerList),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class BannerWidget extends StatelessWidget {
  final List<BannerListModule> _bannerList;

  BannerWidget({
    Key key,
    @required List<BannerListModule> bannerList
  }) : _bannerList = bannerList, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Swiper(
        itemCount: _bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {

            },
            child: Image.network(
              _bannerList[index].icon,
              fit: BoxFit.fill
            ),
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: DotSwiperPaginationBuilder(
            size: 5,
            activeSize: 8,
            color: Colors.white,
            activeColor: Colors.amberAccent
          )
        ),
      ),
    );
  }
}