FROM ghcr.io/mileszim/rails-base-builder:latest AS Builder
FROM ghcr.io/mileszim/rails-base-final:latest

# Workaround to trigger Builder's ONBUILDs to finish:
# COPY --from=Builder /etc/alpine-release /tmp/dummy
# workaround to trigger Builder's ONBUILDs to finish:
COPY --from=Builder /etc/passwd /etc/passwd_builder 

USER app
CMD ["bundle", "exec", "rails", "server"]