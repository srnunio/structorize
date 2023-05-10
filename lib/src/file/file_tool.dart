import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:base_application/src/log.dart';

abstract class FileTools {
  static Directory get directory => Directory.current;

  /// [createNewFolder] this create new folder if not exist
  static Future<bool> createNewFolder(
      {required Directory file, bool recursive = true}) async {
    try {
      if (await file.exists()) return false;

      if (await (await file.create(recursive: recursive)).exists()) return true;
    } catch (error) {
      showError(file.path);
    }
    return false;
  }

  /// [newFile] create a new file if there is no
  static Future<bool> createNewFile({
    required File file,
    required String content,
    bool replace = false,
    String commandLog = '',
  }) async {
    try {
      if (await file.exists() && !replace) {
        showIgnored(file.path, operator: commandLog);
        return true;
      }
      await file.writeAsString(content);
      showCreated(file.path, operator: commandLog);
      return true;
    } catch (error) {
      showError(error.toString(), operator: commandLog);
    }
    return false;
  }

  /// [createFileLink] create path for file
  static String createFileLink(
          {required String fileName, required String dir}) =>
      path.join(dir, fileName);

  /// [constructPath] create path for directory
  static Directory constructPath(
      {required String name, required String defaultPath}) {
    return Directory(path.join(directory.path, '$defaultPath$name'));
  }
}
