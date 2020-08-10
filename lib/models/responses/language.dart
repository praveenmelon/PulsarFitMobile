import 'country.dart';

class Language {
int id;
String code;
String name;
List<Country> countries;

Language({
this.id,
this.code,
this.name,
this.countries,
});

factory Language.fromJson(Map<String, dynamic> json){
if (json != null) {
return Language(
id: json['id'],
code: json['code'],
name: json['name'],
countries: json['countries']?.map<Country>((json) => Country.fromJson(json))?.toList(),
);
}
return null;
}

}