// ignore_for_file: public_member_api_docs, sort_constructors_first
class Itenary {
  final String id;
  final String day;
  final List<ItenaryItem> items;
  Itenary({
    required this.id,
    required this.day,
    required this.items,
  });
}

class ItenaryItem {
  final String startTime;
  final String description;

  ItenaryItem({
    required this.startTime,
    required this.description,
  });
}
