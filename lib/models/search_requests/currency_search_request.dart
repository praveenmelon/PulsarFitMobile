import 'country_search_request.dart';
import 'pagination.dart';

class CurrencySearchRequest {
int id;
String code;
String symbol;
String name;
CountrySearchRequest countries;
bool includeCountries;

Pagination pagination;

CurrencySearchRequest({
this.id,
this.code,
this.symbol,
this.name,
this.countries,
this.includeCountries,
this.pagination,
}){
pagination ??= Pagination();
}

CurrencySearchRequest copyWith({
int id,
String code,
String symbol,
String name,
CountrySearchRequest countries,
bool includeCountries,
Pagination pagination,
}) {
return CurrencySearchRequest(
id: id ?? this.id,
code: code ?? this.code,
symbol: symbol ?? this.symbol,
name: name ?? this.name,
countries: countries ?? this.countries,
includeCountries: includeCountries ?? this.includeCountries,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'code':code,
'symbol':symbol,
'name':name,
'countries':countries?.toJson(),
'includeCountries':includeCountries,
'pagination': pagination?.toJson(),};
}

}