import 'package:structorize/src/architecture/architecture.dart';
import 'package:structorize/src/generate_files.dart';

main(List<String> args) async {
  await generateAssetsFolders();
  if (await generateStructureFolders()) await generateFilesForStructure();
}
