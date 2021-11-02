import 'package:intl/intl.dart';

String dateConverter(String date) {
  // Input date Format
  final format = DateFormat("yyyy-MM-ddTHH:mm:ssZ");
  DateTime gettingDate = format.parse(date);
  final DateFormat formatter = DateFormat('yyyy-MM-dd  HH:mm a');
  // Output Date Format
  final String formatted = formatter.format(gettingDate);
  return formatted;
}

String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
  DateTime notificationDate =
      DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
  final date2 = DateTime.now();
  final difference = date2.difference(notificationDate);

  if (difference.inDays > 8) {
    return dateConverter(dateString);
  } else if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}