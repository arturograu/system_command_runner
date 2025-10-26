import 'package:system_command_runner/system_command_runner.dart';

void main() async {
  const runner = SystemCommandRunner();

  print('=== Basic Command Example ===');
  final echoResult = await runner.run('echo', ['Hello, World!']);
  print('Output: ${echoResult.stdout.trim()}');

  print('\n=== Command with Multiple Arguments ===');
  final multiArgResult = await runner.run('echo', ['Hello', 'from', 'Dart!']);
  print('Output: ${multiArgResult.stdout.trim()}');

  print('\n=== Command in Working Directory ===');
  final pwdResult = await runner.run('pwd', []);
  print('Current directory: ${pwdResult.stdout.trim()}');

  print('\n=== Command with Environment Variables ===');
  final envResult = await runner.run(
    'sh',
    ['-c', 'echo "Environment variable: \$MY_CUSTOM_VAR"'],
    environment: {'MY_CUSTOM_VAR': 'Hello from environment!'},
  );
  print('Output: ${envResult.stdout.trim()}');
}
