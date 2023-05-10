import 'package:base_application/src/entities/info.dart';
import 'package:base_application/src/extension/folder_extension.dart';
import 'package:base_application/src/file/file_tool.dart';

extension FileInfoExtension on FileInfo {
  String get path => _getPath();

  String _getPath() {
    var dir = '';
    folder.forEachDepthFirst(folder, (node) {
      dir = FileTools.constructPath(name: node.value, defaultPath: '').path;
    });
    return FileTools.createFileLink(fileName: '$className$extension', dir: dir);
  }
}
