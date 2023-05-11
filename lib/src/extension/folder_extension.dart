import 'dart:io';

import 'package:structorize/src/entities/folder.dart';

extension FolderExtension on Folder {
  /// [_forEachDepthFirst] run tree
  void forEachDepthFirst(Folder node, performAction(value)) {
    performAction(node);
    for (var child in node.children) {
      var newValue = '${node.value}${Platform.pathSeparator}${child.value}';
      forEachDepthFirst(child.copyWith(value: newValue), performAction);
    }
  }
}