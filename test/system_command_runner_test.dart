import 'package:system_command_runner/system_command_runner.dart';
import 'package:test/test.dart';

void main() {
  group('SystemCommandRunner', () {
    late SystemCommandRunner runner;

    setUp(() {
      runner = const SystemCommandRunner();
    });

    test('should run a simple command successfully', () async {
      final result = await runner.run('echo', ['Hello, World!']);

      expect(result.exitCode, equals(0));
      expect(result.stdout.trim(), equals('Hello, World!'));
      expect(result.stderr, isEmpty);
    });

    test('should handle command failure', () async {
      // Try to run a command that should fail
      // (false command always returns exit code 1)
      final result = await runner.run('false', []);

      expect(result.exitCode, isNot(equals(0)));
    });

    test('should run command with multiple arguments', () async {
      final result = await runner.run('echo', ['Hello', 'World', 'Test']);

      expect(result.exitCode, equals(0));
      expect(result.stdout.trim(), equals('Hello World Test'));
    });

    test('should run command with environment variables', () async {
      final result = await runner.run(
        'sh',
        ['-c', 'echo "\$TEST_VAR"'],
        environment: {'TEST_VAR': 'test_value'},
      );

      expect(result.exitCode, equals(0));
      expect(result.stdout.trim(), equals('test_value'));
    });

    test('should run command in working directory', () async {
      final result = await runner.run(
        'pwd',
        [],
        workingDirectory: '/',
      );

      expect(result.exitCode, equals(0));
      expect(result.stdout.trim(), equals('/'));
    });
  });

  group('CommandResult', () {
    test('should have correct string representation', () {
      const result = CommandResult(
        exitCode: 0,
        stdout: 'output',
        stderr: 'error',
      );

      expect(
          result.toString(),
          equals(
              'CommandResult(exitCode: 0, stdout: "output", stderr: "error")'));
    });

    test('should support equality comparison', () {
      const result1 = CommandResult(exitCode: 0, stdout: 'test', stderr: '');
      const result2 = CommandResult(exitCode: 0, stdout: 'test', stderr: '');
      const result3 = CommandResult(exitCode: 1, stdout: 'test', stderr: '');

      expect(result1, equals(result2));
      expect(result1, isNot(equals(result3)));
    });
  });
}
