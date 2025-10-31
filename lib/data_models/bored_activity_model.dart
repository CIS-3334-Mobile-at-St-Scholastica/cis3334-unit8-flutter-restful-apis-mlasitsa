import 'dart:convert';

BoredActivity boredActivityFromJson(String str) =>
    BoredActivity.fromJson(json.decode(str));

String boredActivityToJson(BoredActivity data) => json.encode(data.toJson());

class BoredActivity {
  final String activity;
  final double availability;          // 0..1
  final String type;
  final int participants;
  final double price;                 // 0..1
  final String accessibilityText;     // e.g. "Few to no challenges"
  final String duration;              // e.g. "hours"
  final bool kidFriendly;
  final String link;                  // may be empty
  final String key;

  BoredActivity({
    required this.activity,
    required this.availability,
    required this.type,
    required this.participants,
    required this.price,
    required this.accessibilityText,
    required this.duration,
    required this.kidFriendly,
    required this.link,
    required this.key,
  });

  factory BoredActivity.fromJson(Map<String, dynamic> json) => BoredActivity(
        activity: json['activity'] ?? '',
        availability: (json['availability'] ?? 0).toDouble(),
        type: json['type'] ?? '',
        participants: (json['participants'] ?? 0) as int,
        price: (json['price'] ?? 0).toDouble(),
        accessibilityText: json['accessibility'] ?? '',
        duration: json['duration'] ?? '',
        kidFriendly: (json['kidFriendly'] ?? false) as bool,
        link: json['link'] ?? '',
        key: json['key'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'activity': activity,
        'availability': availability,
        'type': type,
        'participants': participants,
        'price': price,
        'accessibility': accessibilityText,
        'duration': duration,
        'kidFriendly': kidFriendly,
        'link': link,
        'key': key,
      };
}
