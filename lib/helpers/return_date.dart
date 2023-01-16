import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ReturnDate{
  static String formatDate(Timestamp date) {
    int toSeconds=date.seconds;
    DateTime date1=DateTime.fromMillisecondsSinceEpoch(toSeconds*1000);
    DateFormat df=DateFormat('HH:mm dd-MM-yyyy');
    return df.format(date1);
  }
}