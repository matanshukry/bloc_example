class Item {
  final String name;

  const Item(this.name);

  Item copyWith({String? name}) => Item(name ?? this.name);
}
