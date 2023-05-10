import 'dart:io';

import 'package:base_application/src/entities/folder.dart';
import 'package:base_application/src/extension/folder_extension.dart';
import 'package:base_application/src/file/file_tool.dart';

import '../log.dart';

String getArchitecturePath() {
  return 'lib${Platform.pathSeparator}src';
}

String getNamePackage() {
  var dir = FileTools.constructPath(name: '', defaultPath: '');
  var values = dir.path.split(Platform.pathSeparator);
  return values.last.trim();
}

Folder<String> createApplicationTree() {
  return Folder('application').add(Folder('core'));
}

Folder<String> createDomainTree() {
  return Folder('domain').add(
      Folder('core').addAll([
    Folder('value_objects'),
    Folder('navigator'),
  ]));
}

Folder<String> createInfrastructureTree() {
  return Folder('infrastructure').add(Folder('core').addAll([
    Folder('http_client'),
    Folder('navigator')
  ]));
}

Folder<String> createInjectionTree() => Folder('injection');

Folder<String> createExtensionTree() => Folder('extension');

Folder<String> createPresentationTree() {
  return Folder('presentation').add(Folder('core').add(Folder('components')));
}

Folder<String> createUtilsTree() => Folder('utils');

Folder<String> createAssetsTree() {
  return Folder('assets')
      .addAll([Folder('fonts'), Folder('images'), Folder('icons')]);
}

/// [_createFolders] create all folders
Future<bool> _createFolders(List<Directory> folders) async {
  while (folders.isNotEmpty) {
    if (await FileTools.createNewFolder(file: folders.first)) {
      showCreated(folders.first.path);
      await Future.delayed(Duration(milliseconds: 300));
    }
    folders.removeAt(0);
  }
  return true;
}

/// [generateStructureFolders] create all folders of architecture
Future<bool> generateStructureFolders() async {
  var listDir = <Directory>[];
  var srcFolder = Folder(getArchitecturePath());

  srcFolder.add(createApplicationTree());
  srcFolder.add(createDomainTree());
  srcFolder.add(createExtensionTree());
  srcFolder.add(createInfrastructureTree());
  srcFolder.add(createPresentationTree());
  srcFolder.add(createInjectionTree());
  srcFolder.add(createUtilsTree());
  srcFolder.forEachDepthFirst(srcFolder, (node) {
    var folder = FileTools.constructPath(name: node.value, defaultPath: '');
    listDir.add(folder);
  });
  return await _createFolders(listDir);
}

/// [generateAssetsFolders] create assets folders
Future<bool> generateAssetsFolders() async {
  var listDir = <Directory>[];
  var assetFolder = createAssetsTree();
  assetFolder.forEachDepthFirst(assetFolder, (node) async {
    var folder = FileTools.constructPath(name: node.value, defaultPath: '');
    listDir.add(folder);
  });
  return await _createFolders(listDir);
}
