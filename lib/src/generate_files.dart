import 'dart:io';

import 'package:structorize/src/extension/file_info_extension.dart';

import 'architecture/architecture.dart';
import 'architecture/archives/data_application_scheme.dart';
import 'architecture/archives/data_domain_scheme.dart';
import 'architecture/archives/data_infrastructure_scheme.dart';
import 'architecture/archives/data_injection_scheme.dart';
import 'architecture/archives/data_other_scheme.dart';
import 'architecture/archives/data_presentation_scheme.dart';
import 'architecture/archives/data_utils_scheme.dart';
import 'entities/folder.dart';
import 'entities/info.dart';
import 'file/file_tool.dart';
import 'log.dart';

List<FileInfo> _getApplicationFiles() {
  var package = getNamePackage();
  var path = 'application';
  return [
    FileInfo(
        className: 'base_view_model',
        extension: '.dart',
        folder:
            Folder(getArchitecturePath()).add(Folder(path).add(Folder('core'))),
        content: SCHEME_BASE_VIEW_MODEL.replaceAll('packageName', package))
  ];
}

List<FileInfo> _getDomainFiles() {
  var files = <FileInfo>[];
  var path = 'domain';
  files.add(FileInfo(
      className: 'navigation_service',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('navigator')))),
      content: ABSTRACT_NAVIGATOR_SERVICE_SCHEME));

  files.add(FileInfo(
      className: 'enum_values',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('value_objects')))),
      content: ENUM_VALUES_SCHEME));

  files.add(FileInfo(
      className: 'api',
      extension: '.dart',
      folder:
          Folder(getArchitecturePath()).add(Folder(path).add(Folder('core'))),
      content: ABSTRACT_API_SCHEME));

  return files;
}

List<FileInfo> _getInfrastructureFiles() {
  var package = getNamePackage();
  var files = <FileInfo>[];
  var path = 'infrastructure';
  files.add(FileInfo(
      className: 'default_navigation_service',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('navigator')))),
      content: IMPLEMENTATION_NAVIGATOR_SERVICE_SCHEME.replaceAll(
          'packageName', package)));

  files.add(FileInfo(
      className: 'dio_builder',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('http_client')))),
      content: DIO_BUILDER_SCHEME));

  files.add(FileInfo(
      className: 'api_endpoints',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('http_client')))),
      content: API_ENDPOINTS_SCHEME));
  return files;
}

List<FileInfo> _getInjectionFiles() {
  var package = getNamePackage();
  var files = <FileInfo>[];
  var path = 'injection';
  files.add(FileInfo(
      className: 'injectable_module',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: ABSTRANCT_INJECTION_MODULE_SCHEME));

  files.add(FileInfo(
      className: 'injection',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: INJECTION_SCHEME));

  files.add(FileInfo(
      className: 'config',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: CONFIG_APP_SCHEME.replaceAll('packageName', package)));

  return files;
}

List<FileInfo> _getPresentationFiles() {
  var package = getNamePackage();
  var files = <FileInfo>[];
  var path = 'presentation';
  files.add(FileInfo(
      className: 'base_component',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('components')))),
      content: BASE_COMPONENT_SCHEME));

  files.add(FileInfo(
      className: 'default_app_bar',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('components')))),
      content: APPBAR_WIDGET_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'icon',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('components')))),
      content: ICON_SVG_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'transparent_page_route',
      extension: '.dart',
      folder:
          Folder(getArchitecturePath()).add(Folder(path).add(Folder('core'))),
      content: TRANSPARAENT_ROUTE_SCHEME));

  files.add(FileInfo(
      className: 'bottom_sheet_container',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core').add(Folder('components')))),
      content: BOTTOM_SHEET_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'animation_route',
      extension: '.dart',
      folder: Folder(getArchitecturePath())
          .add(Folder(path).add(Folder('core'))),
      content: ANIMATION_ROUTE_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'splash_screen',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: SPLASH_SCREEN_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'empty_screen',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: EMPTY_SCREEN_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'functions',
      extension: '.dart',
      folder:
          Folder(getArchitecturePath()).add(Folder(path).add(Folder('core'))),
      content: FUCNCTIONS_SCHEME.replaceAll('packageName', package)));

  return files;
}

List<FileInfo> _getUtilsFiles() {
  var package = getNamePackage();
  var files = <FileInfo>[];
  var path = 'utils';
  files.add(FileInfo(
      className: 'color_util',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: COLOR_UTIL_SCHEME));

  files.add(FileInfo(
      className: 'size_util',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: SIZE_UTIL_SCHEME));

  files.add(FileInfo(
      className: 'theme_util',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: THEME_UTIL_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'constants',
      extension: '.dart',
      folder: Folder(getArchitecturePath()).add(Folder(path)),
      content: CONSTANT_UTIL_SCHEME));

  return files;
}

List<FileInfo> _getOtherFiles() {
  var package = getNamePackage();
  var files = <FileInfo>[];
  files.add(FileInfo(
      className: 'app',
      extension: '.dart',
      folder: Folder(getArchitecturePath()),
      content: APP_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'route',
      extension: '.dart',
      folder: Folder('lib'),
      content: ROUTE_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'main',
      extension: '.dart',
      replace: true,
      folder: Folder('lib'),
      content: MAIN_SCHEME.replaceAll('packageName', package)));

  files.add(FileInfo(
      className: 'pubspec',
      extension: '.yaml',
      replace: true,
      folder: Folder(''),
      content: PUBSPEC_SCHEME.replaceAll('packageName', package)));

  return files;
}

Future<bool> generateFilesForStructure() async {
  showInfo('CREATING FILES OF APPLICATION ...');
  await _multiGenerateFiles(list: _getApplicationFiles());

  showInfo('CREATING FILES OF DOMAIN ...');
  await _multiGenerateFiles(list: _getDomainFiles());

  showInfo('CREATING FILES OF INFRASTRUCTURE ...');
  await _multiGenerateFiles(list: _getInfrastructureFiles());

  showInfo('CREATING FILES OF INJECTION ...');
  await _multiGenerateFiles(list: _getInjectionFiles());

  showInfo('CREATING FILES OF PRESENTATION ...');
  await _multiGenerateFiles(list: _getPresentationFiles());

  showInfo('CREATING FILES OF UTILS ...');
  await _multiGenerateFiles(list: _getUtilsFiles());

  showInfo('CREATING OTHER FILES ...');
  await _multiGenerateFiles(list: _getOtherFiles());

  return true;
}

Future<bool> _multiGenerateFiles({required List<FileInfo> list}) async {
  var operator = '\t';
  while (list.isNotEmpty) {
    var info = list[0];
    await FileTools.createNewFile(
        file: File(info.path),
        content: info.content,
        commandLog: operator,
        replace: info.replace);
    list.removeAt(0);
    await Future.delayed(Duration(milliseconds: 300));
  }
  return true;
}
