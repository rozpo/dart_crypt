import '../utils.dart';
import 'src/git_channel.dart';
import 'src/path_channel.dart';

class ChannelCommand extends UtilsCommand {
  @override
  String get name => 'channel';

  @override
  String get description => 'Set channel for the dcrypt.';

  ChannelCommand() {
    addSubcommand(GitChannelCommand());
    addSubcommand(PathChannelCommand());
  }
}
