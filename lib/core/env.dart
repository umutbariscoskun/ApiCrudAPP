import 'dart:developer';

mixin Environments {
  static const String envKey = 'APP_ENV';

  static const String test = 'test';
  static const String uat = 'uat';
  static const String prod = 'prod';
}

class EnvironmentConfig {
  final List<String> _environments = [
    Environments.test,
    Environments.uat,
    Environments.prod,
  ];

  EnvironmentConfig() {
    if (!_environments.contains(_currentEnvironment)) {
      final errorMessage =
          'Unknown environment! (${Environments.envKey}: $_currentEnvironment)';

      log(errorMessage);
      throw Exception(errorMessage);
    }

    log('Current environment: $_currentEnvironment');
  }

  static String get _currentEnvironment =>
      const String.fromEnvironment(Environments.envKey);
  static String get currentEnvironment => _currentEnvironment;

  static bool get isProd => _currentEnvironment == Environments.prod;
  static bool get isDev => _currentEnvironment == Environments.test;
  static bool get isStage => _currentEnvironment == Environments.uat;
}
