import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class PageLogic extends GetxController {

  var yeombjfg = RxBool(false);
  var thxqwemnpj = RxBool(true);
  var ryixdbf = RxString("");
  var yadira = RxBool(false);
  var botsford = RxBool(true);
  final jtbmow = Dio();


  InAppWebViewController? webViewController;

  dynamic igrmuft(){
    final pwxqykvg = InternetConnectionChecker.instance;
    final kndhscbmu = pwxqykvg.onStatusChange.skip(1).listen(
          (InternetConnectionStatus twgmskojhx) {
        if (twgmskojhx == InternetConnectionStatus.connected) {
          wblvem();
        } else {
          Get.toNamed('/fish_error')?.then((_){
            wblvem();
          });
        }
      },
    );
    return kndhscbmu;
  }

  Future<bool> zxolegvib() async {
    var rydekt = await InternetConnectionChecker.instance.hasConnection;
    if(!rydekt){
      Get.toNamed('/fish_error')?.then((_){
        wblvem();
      });
    }
    return rydekt;
  }

  @override
  void onInit() {
    super.onInit();
    igrmuft();
    wblvem();
  }


  Future<void> wblvem() async {

    var gmazcyxtfh = await zxolegvib();
    if(!gmazcyxtfh){
      return;
    }

    yadira.value = true;
    botsford.value = true;
    thxqwemnpj.value = false;

    jtbmow.post("https://hot.seant.it.com/CoZjnt",data: await jopgwlbe()).then((value) {
      var knfeuw = value.data["knfeuw"] as String;
      var uhzx = value.data["uhzx"] as bool;
      if (uhzx) {
        ryixdbf.value = knfeuw;
        mable();
      } else {
        rodriguez();
      }
    }).catchError((e) {
      thxqwemnpj.value = true;
      botsford.value = true;
      yadira.value = false;
    });
  }

  Future<Map<String, dynamic>> jopgwlbe() async {
    final DeviceInfoPlugin czdbn = DeviceInfoPlugin();
    PackageInfo qythus_lrvod = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var djynumf = Platform.localeName;
    var RvkF = currentTimeZone;

    var AcXRhfpk = qythus_lrvod.packageName;
    var hnRGM = qythus_lrvod.version;
    var gqxN = qythus_lrvod.buildNumber;

    var RiUyu = qythus_lrvod.appName;
    var JFfilO = "";
    var MLCBhX  = "";
    var umCh = "";
    var brandtDach = "";
    var rodgerRyan = "";
    var rogelioCole = "";


    var BuoGexy = "";
    var bcTliOtu = false;

    if (GetPlatform.isAndroid) {
      BuoGexy = "android";
      var tkqxgl = await czdbn.androidInfo;

      umCh = tkqxgl.brand;

      JFfilO  = tkqxgl.model;
      MLCBhX = tkqxgl.id;

      bcTliOtu = tkqxgl.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      BuoGexy = "ios";
      var renaou = await czdbn.iosInfo;
      umCh = renaou.name;
      JFfilO = renaou.model;

      MLCBhX = renaou.identifierForVendor ?? "";
      bcTliOtu  = renaou.isPhysicalDevice;
    }
    var res = {
      "RiUyu": RiUyu,
      "gqxN": gqxN,
      "MLCBhX": MLCBhX,
      "hnRGM": hnRGM,
      "JFfilO": JFfilO,
      "RvkF": RvkF,
      "umCh": umCh,
      "rodgerRyan" : rodgerRyan,
      "djynumf": djynumf,
      "BuoGexy": BuoGexy,
      "AcXRhfpk": AcXRhfpk,
      "bcTliOtu": bcTliOtu,
      "brandtDach" : brandtDach,
      "rogelioCole" : rogelioCole,

    };
    return res;
  }

  Future<void> rodriguez() async {
    Get.offAllNamed("/fish_tab");
  }

  Future<void> mable() async {
    Get.offAllNamed("/fish_init");
  }

  @override
  void dispose() {
    igrmuft().cancel();
    super.dispose();
  }

}
