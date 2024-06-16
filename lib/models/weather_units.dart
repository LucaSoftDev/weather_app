class Unit {
  final String _value;

  String get value => _value;

  const Unit._internal(this._value);

  static const Unit metric = Unit._internal('metric');
  static const Unit imperial = Unit._internal('imperial');
}
