class UserEvent {
  final int userId;
  final int eventId;


  UserEvent({
    required this.userId,
    required this.eventId,
  });

  // Convert Event object to Map object
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'eventId': eventId,
    };
  }

  // Convert Map object to Event object
  factory UserEvent.fromMap(Map<String, dynamic> map) {
    return UserEvent(
      userId: map['userId'],
      eventId: map['eventId'],
    );
  }
}
