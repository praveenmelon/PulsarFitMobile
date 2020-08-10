import 'country_search_request.dart';
import 'pagination.dart';

class CitySearchRequest {
int id;
String name;
double longitude;
double latitude;
int countryId;
CountrySearchRequest country;
bool includeCountry;

Pagination pagination;

CitySearchRequest({
this.id,
this.name,
this.longitude,
this.latitude,
this.countryId,
this.country,
this.includeCountry,
this.pagination,
}){
pagination ??= Pagination();
}

CitySearchRequest copyWith({
int id,
String name,
double longitude,
double latitude,
int countryId,
CountrySearchRequest country,
bool includeCountry,
Pagination pagination,
}) {
return CitySearchRequest(
id: id ?? this.id,
name: name ?? this.name,
longitude: longitude ?? this.longitude,
latitude: latitude ?? this.latitude,
countryId: countryId ?? this.countryId,
country: country ?? this.country,
includeCountry: includeCountry ?? this.includeCountry,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'name':name,
'longitude':longitude,
'latitude':latitude,
'countryId':countryId,
'country':country?.toJson(),
'includeCountry':includeCountry,
'pagination': pagination?.toJson(),};
}

}