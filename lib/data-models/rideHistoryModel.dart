class Ride {
  String rideID;
  String driverID;
  String riderID;
  String riderName;
  String driverName;
  String driverPhoneNumber;
  String riderPhoneNumber;
  String ratingGiven;
  String tripCost;
  Duration timeElapsed;
  String rideDate;

  Ride(
      {this.riderName,
      this.rideID,
      this.driverID,
      this.riderID,
      this.driverName,
      this.driverPhoneNumber,
      this.ratingGiven,
      this.riderPhoneNumber,
      this.timeElapsed,
      this.rideDate,
      this.tripCost});
}
