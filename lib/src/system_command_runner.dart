import 'dart:io';

import 'command_result.dart';

/// Testable wrapper around [Process.run].
class SystemCommandRunner {
  const SystemCommandRunner();

  /// Runs a system command.
  ///
  /// Returns a [CommandResult] with exit code, stdout, and stderr.
  Future<CommandResult> run(
    String executable,
    List<String> arguments, {
    String? workingDirectory,
    Map<String, String>? environment,
  }) async {
    final result = await Process.run(
      executable,
      arguments,
      workingDirectory: workingDirectory,
      environment: environment,
    );
    return CommandResult(
      exitCode: result.exitCode,
      stdout: result.stdout.toString(),
      stderr: result.stderr.toString(),
    );
  }
}
