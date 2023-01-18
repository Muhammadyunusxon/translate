class TranslateModel{
String? sourceLanguage;
String? targetLanguage;
String? text;

// ignore: non_constant_identifier_names
TranslateModel({required this.sourceLanguage,required this.targetLanguage,required this.text});

Map toJson() => { "source_language": sourceLanguage,"target_language": targetLanguage,"text": text};

}