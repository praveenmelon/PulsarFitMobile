import 'currency.dart';
import 'city.dart';

class Country {
int id;
String code;
String name;
int currencyId;
Currency currency;
List<City> cities;

Country({
this.id,
this.code,
this.name,
this.currencyId,
this.currency,
this.cities,
});

factory Country.fromJson(Map<String, dynamic> json){
if (json != null) {
return Country(
id: json['id'],
code: json['code'],
name: json['name'],
currencyId: json['currencyId'],
currency: Currency.fromJson(json['currency']),
cities: json['cities']?.map<City>((json) => City.fromJson(json))?.toList(),
);
}
return null;
}

}