import 'package:colicoli_delivery/intl/str_res_en.dart';
import 'package:colicoli_delivery/intl/str_res_fr.dart';
import 'package:colicoli_delivery/intl/str_res_zh.dart';
import 'package:get/get.dart';

class StrRes extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      {'zh_CN': zh_CN_res, 'en_US': en_US_res, 'fr_FR': fr_FR_res};
}
