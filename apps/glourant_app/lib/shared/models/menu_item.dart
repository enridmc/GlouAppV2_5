class MenuItem {
  const MenuItem({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.available,
  });

  final String name;
  final String category;
  final String description;
  final double price;
  final bool available;
}
