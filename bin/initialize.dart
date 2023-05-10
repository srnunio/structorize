import 'package:base_application/src/architecture/architecture.dart';
import 'package:base_application/src/generate_files.dart';

main(List<String> args) async {
  await generateAssetsFolders();
  if (await generateStructureFolders()) await generateFilesForStructure();
}
