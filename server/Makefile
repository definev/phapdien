watch_gen:
	@fvm flutter pub run build_runner watch --delete-conflicting-outputs

docker_clean:
	@docker-compose down --rmi all --volumes --remove-orphans

docker_build:
	@docker-compose build

docker_up:
	@docker-compose up -d

docker_down:
	@docker-compose down


# Dart-scripts
crawling:
	@dart run bin/crawl_data.dart
