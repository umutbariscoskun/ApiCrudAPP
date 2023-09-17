build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs


run-ios-debug-test:
	flutter run --target lib/main.dart --flavor test --dart-define=APP_ENV=test

run-android-debug-dev:
	flutter run --target lib/main.dart --flavor dev --dart-define=APP_ENV=test

run-debug-uat:
	flutter run --target lib/main.dart --flavor uat --dart-define=APP_ENV=uat

run-debug-prod:
	flutter run --target lib/main.dart --flavor prod --dart-define=APP_ENV=prod