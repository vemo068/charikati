class Buy {
  int? id;
  DateTime date;
  int clientId;
  Buy({required this.date, required this.clientId, this.id});
  Map<String, dynamic> toMap() {
  return {
    'id': id,
    'date': date,
    'clientId': clientId,
  };
}
 factory Buy.fromMap(Map<String, dynamic> map){
  return Buy(
    id: map['id']?.toInt() ?? 0,
    date: map['date'] ,
    clientId: map['clientId'] ,
  );}
}


