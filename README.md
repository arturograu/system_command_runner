# System Command Runner

[![pub package](https://img.shields.io/pub/v/system_command_runner.svg)](https://pub.dev/packages/system_command_runner)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/arturograu/system_command_runner/main.yaml?branch=main)
[![Pull Requests are welcome](https://img.shields.io/badge/license-MIT-blue)](https://github.com/arturograu/system_command_runner/blob/master/LICENSE)
[![codecov](https://codecov.io/gh/arturograu/system_command_runner/graph/badge.svg?token=VOTb7luKz5)](https://codecov.io/gh/arturograu/system_command_runner)
![Null safety](https://img.shields.io/badge/null%20safety-true-brightgreen)

A testable wrapper around `Process.run` for executing system commands.

## Why?

`Process.run` is hard to mock. This package provides a simple, injectable wrapper that makes your code testable.

## Installation

```yaml
dependencies:
  system_command_runner: ^0.1.0
```

## Usage

```dart
import 'package:system_command_runner/system_command_runner.dart';

final runner = const SystemCommandRunner();

// Basic command
final result = await runner.run('echo', ['Hello, World!']);
print(result.stdout); // Hello, World!

// With working directory and environment
final result2 = await runner.run(
  'git',
  ['status'],
  workingDirectory: '/path/to/repo',
  environment: {'GIT_CONFIG': '/custom/config'},
);
```

## Testing

```dart
class MockSystemCommandRunner extends Mock implements SystemCommandRunner {}

// In your test
when(() => mockRunner.run('git', ['status'])).thenAnswer(
  (_) async => CommandResult(exitCode: 0, stdout: 'clean', stderr: ''),
);
```

## API

### SystemCommandRunner

- `run(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment})`

### CommandResult

- `exitCode` - Exit code
- `stdout` - Standard output
- `stderr` - Standard error
