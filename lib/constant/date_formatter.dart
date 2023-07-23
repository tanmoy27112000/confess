import 'package:intl/intl.dart';

class KdateFormatter {
  static final DateFormat mmddyyyy = DateFormat('MM-dd-yyyy');
  // dd MMM yyyy
  static final DateFormat ddMMMyyy = DateFormat('dd MMM yyyy');

  //10-10-2022
  static final DateFormat ddMMyyyy = DateFormat('dd-MM-yyyy');

  //08:00 AM
  static final DateFormat hhmma = DateFormat('hh:mm a');
}
