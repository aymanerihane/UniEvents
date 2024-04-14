class Event {
  int? eventId;
  String eventName;
  String eventDescription;
  String eventType;
  String eventDate;
  String eventStartTime;
  String eventEndTime;
  int color;
  String repeat;
  int dayOfWeek;
  int dayOfMonth;
  int month;
  String? eventImage;

  Event({
    this.eventId,
    required this.eventName,
    required this.eventDescription,
    required this.eventType,
    required this.eventDate,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.color,
    required this.repeat,
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.month,
    required this.eventImage,
  });

  // Convert Event object to Map object
  Map<String, dynamic> toMap() {
    return {
      'eventId': eventId,
      'eventName': eventName,
      'eventDescription': eventDescription,
      'eventType': eventType,
      'eventDate': eventDate,
      'eventStartTime': eventStartTime,
      'eventEndTime': eventEndTime,
      'color': color,
      'repeat': repeat,
      'dayOfWeek': dayOfWeek,
      'dayOfMonth': dayOfMonth,
      'month': month,
      'eventImage': eventImage,
    };
  }

  // Convert Map object to Event object
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      eventId: map['eventId'],
      eventName: map['eventName'],
      eventDescription: map['eventDescription'],
      eventType: map['eventType'],
      eventDate: map['eventDate'],
      eventStartTime: map['eventStartTime'],
      eventEndTime: map['eventEndTime'],
      color: map['color'],
      repeat: map['repeat'],
      dayOfWeek: map['dayOfWeek'],
      dayOfMonth: map['dayOfMonth'],
      month: map['month'],
      eventImage: map['eventImage'],
    );
  }
}
