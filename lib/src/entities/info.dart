import 'package:structorize/src/entities/folder.dart';

class FileInfo {
  final String className;

  final String extension;

  final String content;

  final bool replace;

  final Folder<String> folder;

  FileInfo(
      {required this.className,
      required this.extension,
      required this.folder,
      this.replace = false,
      required this.content});
}
