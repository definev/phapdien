# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe bin/server.dart -o bin/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/specs/ /app/specs/
COPY --from=build /app/bin/server /app/bin/
COPY --from=build /app/env/production.json /app/env/
COPY --from=build /app/crawl_data/mapped /app/crawl_data/mapped 

WORKDIR /app

# Start server.
CMD ["/app/bin/server"]