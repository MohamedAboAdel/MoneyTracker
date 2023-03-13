// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Expenses {
  int? id;
  int? date;
  int? dateAlarm;
  String? group;
  int? amount;
  int? isPaied;
  String? walletMoney;
  String? note;
  Expenses({
    this.id,
    this.date,
    this.dateAlarm,
    this.group,
    this.amount,
    this.isPaied,
    this.walletMoney,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'dateAlarm': dateAlarm,
      'group': group,
      'amount': amount,
      'isPaied': isPaied,
      'walletMoney': walletMoney,
      'note': note,
    };
  }

  factory Expenses.fromMap(Map<String, dynamic> map) {
    return Expenses(
      id: map['id'] != null ? map['id'] as int : null,
      date: map['date'] != null ? map['date'] as int : null,
      dateAlarm: map['dateAlarm'] != null ? map['dateAlarm'] as int : null,
      group: map['group'] != null ? map['group'] as String : null,
      amount: map['amount'] != null ? map['amount'] as int : null,
      isPaied: map['isPaied'] != null ? map['isPaied'] as int : null,
      walletMoney:
          map['walletMoney'] != null ? map['walletMoney'] as String : null,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  factory Expenses.fromJson(String source) =>
      Expenses.fromMap(json.decode(source) as Map<String, dynamic>);
}
