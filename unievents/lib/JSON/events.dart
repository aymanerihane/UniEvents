class Event {
  int? eventId;
  String eventName;
  String eventDescription;
  String eventType;
  String eventDate;
  String eventStartTime;
  String eventEndTime;
  String color;
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
    this.eventImage,
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
      eventImage: map['eventImage'],
    );
  }
}
