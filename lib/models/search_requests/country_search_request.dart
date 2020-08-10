import 'currency_search_request.dart';
import 'city_search_request.dart';
import 'pagination.dart';

class CountrySearchRequest {
int id;
String code;
String name;
int currencyId;
CurrencySearchRequest currency;
CitySearchRequest cities;
bool includeCurrency;
bool includeCities;

Pagination pagination;

CountrySearchRequest({
this.id,
this.code,
this.name,
this.currencyId,
this.currency,
this.cities,
this.includeCurrency,
this.includeCities,
this.pagination,
}){
pagination ??= Pagination();
}

CountrySearchRequest copyWith({
int id,
String code,
String name,
int currencyId,
CurrencySearchRequest currency,
CitySearchRequest cities,
bool includeCurrency,
bool includeCities,
Pagination pagination,
}) {
return CountrySearchRequest(
id: id ?? this.id,
code: code ?? this.code,
name: name ?? this.name,
currencyId: currencyId ?? this.currencyId,
currency: currency ?? this.currency,
cities: cities ?? this.cities,
includeCurrency: includeCurrency ?? this.includeCurrency,
includeCities: includeCities ?? this.includeCities,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'code':code,
'name':name,
'currencyId':currencyId,
'currency':currency?.toJson(),
'cities':cities?.toJson(),
'includeCurrency':includeCurrency,
'includeCities':includeCities,
'pagination': pagination?.toJson(),};
}

}