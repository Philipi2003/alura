import 'dart:convert';

class Account {
  String id;
  String name;
  String lastName;
  double balance;

  Account({
    required this.id,
    required this.name,
    required this.lastName,
    required this.balance
  });

  factory Account.fromMap(Map<String,dynamic> map){
    return Account(id: map['id'], name: map['name'], lastName: map['lastName'], balance: map['balance']);
  }

  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "lastName": lastName,
      "balance": balance
    };
  }

  Account copyWith({
    String? id,
    String? name,
    String? lastName,
    double? balance
  }){
    return Account(id: id ?? this.id, name: name ?? this.name, lastName: lastName ?? this.lastName, balance: balance ?? this.balance);
  }

  dynamic toJson(){
    return jsonEncode(this.toMap());
  }

  factory Account.fromJson(dynamic json){
    return Account.fromMap(jsonDecode(json) as Map<String,dynamic>);
  }

  String toString(){
    return '''
      {
        $id, 
        $name, 
        $lastName, 
        $balance
      }
    ''';
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)){
      return true;
    }
    return other is Account && id == other.id && name == other.name && lastName == other.lastName && balance == other.balance;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode ^ name.hashCode ^ lastName.hashCode ^ balance.hashCode;
}