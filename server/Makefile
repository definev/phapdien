# Include prod.env if it exists
define setup_env
	$(eval ENV_FILE := env/$(1).env)
	@echo " - setup env $(ENV_FILE)"
	$(eval include env/$(1).env)
	$(eval export sed 's/=.*//' env/$(1).env)
endef


# Define a target that uses the environment variables
example_target:

watch_gen:
	@fvm flutter pub run build_runner watch --delete-conflicting-outputs

docker_build:
	@docker-compose build

docker_up:
	@docker-compose up -d

docker_down:
	@docker-compose down


# Dart-scripts
crawling:
	@dart run bin/crawl_data.dart

feeding:
	$(call setup_env,production)
	@dart run bin/feed_data.dart

query:
	@dart run bin/query_chroma.dart