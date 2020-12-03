/// Creates a x Hours x Min string from given minutes number.
/// If hours is 0 it only returns x Min.
getHourMinutesStringFromMinutes(int minute) {
  var totalHours = (minute / 60).floor();
  var minutes = (minute % 60).floor();

  if (totalHours == 0) {
    return '${minutes}Min';
  } else {
    return '${totalHours}Hours ${minutes}Min';
  }
}
