import 'dart:io';

extension FileEx on File {
  String get name => _getName();

  String _getName() {
    var values = path.split(Platform.pathSeparator);
    if (values.isEmpty) return ('');
    return values.last;
  }
}
