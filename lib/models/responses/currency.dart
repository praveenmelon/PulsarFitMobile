import 'country.dart';

class Currency {
int id;
String code;
String symbol;
String name;
List<Country> countries;

Currency({
this.id,
this.code,
this.symbol,
this.name,
this.countries,
});

factory Currency.fromJson(Map<String, dynamic> json){
if (json != null) {
return Currency(
id: json['id'],
code: json['code'],
symbol: json['symbol'],
name: json['name'],
countries: json['countries']?.map<Country>((json) => Country.fromJson(json))?.toList(),
);
}
return null;
}

}