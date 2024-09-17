import 'dart:io';

String getLang() {
  List<String> availableLangs = ["en", "tr", "es"];
  String lang = Platform.localeName.split("_")[0];
  if (availableLangs.contains(lang))
    return lang;
  else
    return "en";
}
