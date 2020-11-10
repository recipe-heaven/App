/// Converts a map string key values to Symbols
Map<Symbol, dynamic> symbolizeKeys(Map<String, dynamic> map) =>
    map.map((key, value) => MapEntry(Symbol(key), value));
