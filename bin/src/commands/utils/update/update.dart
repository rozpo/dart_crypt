import '../../../utils/strings.dart';
import '../utils.dart';

class UpdateCommand extends UtilsCommand {
  @override
  String get name => 'update';

  @override
  String get description => 'Update ${Strings.binName} to the latest version';
}
