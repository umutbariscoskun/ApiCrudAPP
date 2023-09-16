build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs


	#Builds the application for the dev environment.

run-ios-debug-dev:
	flutter run --target lib/main.dart --flavor test --dart-define=APP_ENV=test

run-ios-debug-uat:
	flutter run --target lib/main.dart --flavor uat --dart-define=APP_ENV=uat

run-ios-debug-prod:
	flutter run --target lib/main.dart --flavor prod --dart-define=APP_ENV=prod