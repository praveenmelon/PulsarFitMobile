import 'role_functionality.dart';

class Functionality {
int id;
String assembly;
String controller;
String action;
List<RoleFunctionality> roleFunctionalities;

Functionality({
this.id,
this.assembly,
this.controller,
this.action,
this.roleFunctionalities,
});

factory Functionality.fromJson(Map<String, dynamic> json){
if (json != null) {
return Functionality(
id: json['id'],
assembly: json['assembly'],
controller: json['controller'],
action: json['action'],
roleFunctionalities: json['roleFunctionalities']?.map<RoleFunctionality>((json) => RoleFunctionality.fromJson(json))?.toList(),
);
}
return null;
}

}