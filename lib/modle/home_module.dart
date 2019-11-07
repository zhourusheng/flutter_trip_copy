import 'banner_list_module.dart';

class HomeModule {
  // Config config;

  List<BannerListModule> bannerList;

  HomeModule({
    // this.config,
    this.bannerList
  });

  HomeModule.fromJson(Map<String, dynamic> json) {
    // config = json['config'] != null ? new Config.fromJson(json['config']) : null;
    if (json['bannerList'] != null) {
      bannerList = new List<BannerListModule> ();
      json['bannerList'].forEach((v) {
        bannerList.add(
          new BannerListModule.fromJson(v)
        );
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic> ();
    if (this.bannerList != null) {
        data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}