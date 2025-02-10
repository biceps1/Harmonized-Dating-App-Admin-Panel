
String formatDate(DateTime? datePosted) {
  if (datePosted == null) {
    return 'N/A'; // Return 'N/A' if the date is null
  }

  // Extract day, month, and year
  String day = datePosted.day.toString().padLeft(2, '0'); // Two digits for day
  String month =
      datePosted.month.toString().padLeft(2, '0'); // Two digits for month
  String year = datePosted.year.toString();

  // Get the day of the week (e.g., Monday, Tuesday)
  List<String> weekdays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String weekday =
      weekdays[datePosted.weekday % 7]; // Use modulo to get the correct index

  // Return formatted date as 'Day, dd-MM-yyyy'
  return '$weekday, $day-$month-$year';
}
