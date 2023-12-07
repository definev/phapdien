# Include prod.env if it exists
define setup_env
	$(eval ENV_FILE := env/$(1).env)
	@echo " - setup env $(ENV_FILE)"
	$(eval include env/$(1).env)
	$(eval export sed 's/=.*//' env/$(1).env)
endef


watch_gen:
	@fvm flutter pub run build_runner watch --delete-conflicting-outputs

docker_clean:
	@docker-compose down --rmi all --volumes --remove-orphans

docker_build:
	@docker-compose build

docker:
	chmod +x ./scripts/docker.sh
	./scripts/docker.sh

docker_down:
	chmod +x ./scripts/docker_down.sh
	./scripts/docker_down.sh

# Dart-scripts
start_local_server:
	@dart run bin/server.dart

regen_ids:
	@dart run bin/regenerate_ids.dart

convert_crawl_data_to_map:
	@dart run bin/convert_crawl_data_to_map.dart

crawling:
	echo "Start crawling"
	@dart run bin/crawl_data.dart

chroma_feeding:
	$(call setup_env,production)
	@dart run bin/feed_data_chroma.dart

chroma_query:
	@dart run bin/query_chroma.dart

pinecone_feeding:
	$(call setup_env,production)
	@dart run bin/feed_data_pinecone.dart

pinecone_query:
	@dart run bin/query_pinecone.dart