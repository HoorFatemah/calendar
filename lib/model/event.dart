class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final bool isAllDay; // Add this line to define the named parameter

  Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.isAllDay = false, // Add this line to define the named parameter
  });
}
