import 'country_search_request.dart';
import 'pagination.dart';

class LanguageSearchRequest {
int id;
String code;
String name;
CountrySearchRequest countries;
bool includeCountries;

Pagination pagination;

LanguageSearchRequest({
this.id,
this.code,
this.name,
this.countries,
this.includeCountries,
this.pagination,
}){
pagination ??= Pagination();
}

LanguageSearchRequest copyWith({
int id,
String code,
String name,
CountrySearchRequest countries,
bool includeCountries,
Pagination pagination,
}) {
return LanguageSearchRequest(
id: id ?? this.id,
code: code ?? this.code,
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
'name':name,
'countries':countries?.toJson(),
'includeCountries':includeCountries,
'pagination': pagination?.toJson(),};
}

}