
class Folder<String> {
  final String value;

  List<Folder<String>> children = [];

  bool get hasChildren => children.isNotEmpty;

  Folder(this.value);

  Folder<String> add(Folder<String> child) {
    children.add(child);
    return this;
  }

  Folder<String> addAll(List<Folder<String>> list) {
    children = list;
    return this;
  }

  Folder<String> copyWith({String? value}) {
    var folder = Folder(value ?? this.value);
    folder.addAll(children);
    return folder;
  }
}
