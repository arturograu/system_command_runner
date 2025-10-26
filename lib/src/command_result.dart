/// Result of a system command execution.
class CommandResult {
  /// Creates a [CommandResult].
  const CommandResult({
    required this.exitCode,
    required this.stdout,
    required this.stderr,
  });

  /// Exit code returned by the command.
  final int exitCode;

  /// Standard output from the command.
  final String stdout;

  /// Standard error output from the command.
  final String stderr;

  @override
  String toString() {
    return 'CommandResult(exitCode: $exitCode, stdout: "$stdout", stderr: "$stderr")';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommandResult &&
        other.exitCode == exitCode &&
        other.stdout == stdout &&
        other.stderr == stderr;
  }

  @override
  int get hashCode => Object.hash(exitCode, stdout, stderr);
}
