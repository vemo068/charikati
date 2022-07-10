class Buy {
  int? id;
  int total;
  DateTime date;
  int clientId;
  Buy({required this.date, required this.total,required this.clientId, this.id});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'date': date,
      'clientId': clientId,
    };
  }

  factory Buy.fromMap(Map<String, dynamic> map) {
    return Buy(
      id: map['id']?.toInt() ?? 0,
      date: map['date'],
      clientId: map['clientId'],
      total: map['total'],
    );
  }
}
