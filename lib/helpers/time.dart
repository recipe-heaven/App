/// Creates a x Hours x Min string from given seconds number.
/// If hours is 0 it only returns x Min.
getHourSecndsStringFromSeconds(int seconds) {
  var totalHours = (seconds / 3600).floor();
  var minutes = (seconds % 3600 / 60).floor();

  if (totalHours == 0) {
    return '${minutes}Min';
  } else {
    return '${totalHours}Hours ${minutes}Min';
  }
}
