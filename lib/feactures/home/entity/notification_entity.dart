class NotificationsEntity {
  final String id;
  final String title;
  final String body;
  final DateTime sentAt;

  NotificationsEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.sentAt,
  });
  factory NotificationsEntity.fromJson(Map<String, dynamic> json) {
    return NotificationsEntity(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      sentAt: DateTime.parse(json['sent_at']),
    );
  }
}
