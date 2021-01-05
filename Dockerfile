FROM ghcr.io/mileszim/rails-base-builder:3.0.0-alpine AS Builder
FROM ghcr.io/mileszim/rails-base-final:3.0.0-alpine
# USER app
COPY . .
CMD ["bundle", "exec", "rails", "server"]
